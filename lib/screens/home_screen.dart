import 'package:flutter/material.dart';
import '../widgets/travel_card.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                
                // --- Header Section ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Hey, Traveler!", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                        Text("Where do you want to go today?", style: TextStyle(color: Colors.grey, fontSize: 15)),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                    ),
                  ],
                ),
                
                const SizedBox(height: 25),

                // --- Search Bar Section ---
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Search places in Sri Lanka...",
                      border: InputBorder.none,
                      icon: Icon(Icons.search, color: Colors.blueAccent),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                
                // --- Recently Explored (Horizontal) ---
                const Text("Recently Explored", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                
                SizedBox(
                  height: 260,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      TravelCard(
                        width: 240,
                        title: "Sigiriya Rock",
                        location: "Matale, Sri Lanka",
                        image: "https://images.unsplash.com/photo-1588598116712-42938816c891",
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DetailsScreen())),
                      ),
                      TravelCard(
                        width: 240,
                        title: "Ella Nine Arch",
                        location: "Ella, Sri Lanka",
                        image: "https://images.unsplash.com/photo-1543731068-7e0f5beff43a",
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DetailsScreen())),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // --- Popular Destinations (Vertical) ---
                const Text("Popular Destinations", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),

                TravelCard(
                  title: "Galle Fort",
                  location: "Galle, Sri Lanka",
                  image: "https://images.unsplash.com/photo-1625736312933-911e03882772",
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DetailsScreen())),
                ),
                TravelCard(
                  title: "Temple of Tooth",
                  location: "Kandy, Sri Lanka",
                  image: "https://images.unsplash.com/photo-1581446450519-724831610e2f",
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DetailsScreen())),
                ),
                
                const SizedBox(height: 20), // Bottom padding
              ],
            ),
          ),
        ),
      ),
    );
  }
}