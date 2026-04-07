import 'package:flutter/material.dart';
import '../widgets/top_banner.dart';
import '../widgets/travel_card.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const TopBanner(imagePath: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=800'),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text("Popular Places", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          // Scrollable list
          TravelCard(
            title: "Mountain View", 
            location: "California, USA",
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailsScreen())),
          ),
          TravelCard(
            title: "Eiffel Tower", 
            location: "Paris, France",
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailsScreen())),
          ),
        ],
      ),
    );
  }
}