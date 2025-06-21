class Event {
  final String id;
  final String name;
  final String imageUrl;     
  final DateTime? date;       

  Event({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.date,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json['id'] as String,
        name: json['name'] as String? ?? '',
        imageUrl: json['image_url'] as String? ??
            'https://picsum.photos/seed/${json['id']}/600/400',
        date: json['event_date'] != null
            ? DateTime.parse(json['event_date'] as String)
            : null,
      );
}
