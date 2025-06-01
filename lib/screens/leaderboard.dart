import 'package:flutter/material.dart';

class SHPEUCFApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LeaderboardScreen(),
    );
  }
}

class LeaderboardScreen extends StatelessWidget {
  final List<String> users = List.generate(6, (_) => 'Gabyc2001');
  final List<int> scores = List.generate(6, (_) => 999);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A174E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              SizedBox(height: 10),
              Center(child: Image.asset('assets/Leaderboard.png', height: 50)),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'LEADERBOARD',
                  style: TextStyle(
                    color: Color(0xFFF2AC02),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(4, (index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor:
                            index == 1 ? Colors.white : Color(0xFFF2AC02),
                        child: Icon(Icons.person, color: Colors.blue[900]),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '999',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                }),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.person, color: Colors.blue[900]),
                        title: Text(
                          users[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          scores[index].toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.home, color: Color(0xFFF2AC02)),
                  Icon(Icons.event, color: Color(0xFFF2AC02)),
                  Icon(Icons.camera, color: Color(0xFFF2AC02)),
                  Icon(Icons.settings, color: Color(0xFFF2AC02)),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
