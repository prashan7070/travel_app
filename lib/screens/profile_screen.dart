import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleAvatar(radius: 60, child: Icon(Icons.person, size: 60)),
          SizedBox(height: 20),
          Text("Intern Name", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text("intern@example.com", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}