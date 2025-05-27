import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient _client = Supabase.instance.client;

  /// Insert a new user into Supabase
  Future<void> insertUser({
    required String firebaseUid,
    required String? email,
    required String firstname,
    required String lastname,
    required int ucfid,
    required String birthday,
  }) async {
    final response = await _client.from('users').insert({
      'firebase_uid': firebaseUid,
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'ucfid': ucfid,
      'birthday': birthday,
    }).execute();

    if (response.status != 201 && response.status != 200) {
      throw Exception('Supabase insert failed: ${response.data}');
    }
  }

  /// Get user by Firebase UID
  Future<Map<String, dynamic>?> getUserByFirebaseUid(String firebaseUid) async {
    final response = await _client
        .from('users')
        .select()
        .eq('firebase_uid', firebaseUid)
        .single()
        .execute();

    if (response.status != 200) {
      throw Exception('User not found: ${response.data}');
    }

    return response.data;
  }

  /// Update user’s email
  Future<void> updateUserEmail(String firebaseUid, String newEmail) async {
    final response = await _client
        .from('users')
        .update({'email': newEmail})
        .eq('firebase_uid', firebaseUid)
        .execute();

    if (response.status != 204 && response.status != 200) {
      throw Exception('Failed to update email: ${response.data}');
    }
  }

  /// Fetch all users (admin use case)
  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final response = await _client.from('users').select().execute();

    if (response.status != 200) {
      throw Exception('Failed to fetch users: ${response.data}');
    }

    return List<Map<String, dynamic>>.from(response.data);
  }
}
