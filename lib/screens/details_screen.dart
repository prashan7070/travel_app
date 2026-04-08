import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details")),
      body: Column(
        children: [
          Image.network('https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=800'),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Mountain View", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("Rating: ⭐ 4.5", style: TextStyle(fontSize: 18, color: Colors.orange)),
                SizedBox(height: 15),
                Text("This is a beautiful place to visit. Experience nature at its best with fresh air and amazing scenery."),
              ],
            ),
          )
        ],
      ),
    );
  }
}