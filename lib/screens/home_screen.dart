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
                        Text(
                          "Hey, Traveler!",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Text(
                          "Where do you want to go today?",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.person, color: Colors.white, size: 30),
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
                const Text(
                  "Recently Explored",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),

                SizedBox(
                  height: 260,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      // Sigiriya Image
                      TravelCard(
                        width: 240,
                        title: "Sigiriya Rock",
                        location: "Matale, Sri Lanka",
                        image: "assets/images/sigiriya.png",
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DetailsScreen(
                          title: "Sigiriya Rock",
                          location: "Matale, Sri Lanka",
                          imagePath: "assets/images/sigiriya.png",
                          rating: 4.8,
                          description: "Sigiriya or Sinhagiri is an ancient rock fortress located in the northern Matale District near the town of Dambulla in the Central Province, Sri Lanka. It is a site of historical and archaeological significance that is dominated by a massive column of rock around 200 metres high.",
                        ))),
                      ),
                      // Nine Arch Bridge
                      TravelCard(
                        width: 240,
                        title: "Nine Arch Bridge",
                        location: "Ella, Sri Lanka",
                        image: "assets/images/nine_arch.png",
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DetailsScreen(
                          title: "Nine Arch Bridge",
                          location: "Ella, Sri Lanka",
                          imagePath: "assets/images/nine_arch.png",
                          rating: 4.9,
                          description: "The Nine Arch Bridge also called the Bridge in the Sky, is a viaduct bridge in Sri Lanka. It is one of the best examples of colonial-era railway construction in the country. Let the scenic beauty of the environment charm you.",
                        ))),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // --- Popular Destinations (Vertical) ---
                const Text(
                  "Popular Destinations",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),

                // Galle Fort Image
                TravelCard(
                  title: "Galle Fort",
                  location: "Galle, Sri Lanka",
                  image: "assets/images/galle_fort.png",
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DetailsScreen(
                    title: "Galle Fort",
                    location: "Galle, Sri Lanka",
                    imagePath: "assets/images/galle_fort.png",
                    rating: 4.7,
                    description: "Galle Fort, in the Bay of Galle on the south west coast of Sri Lanka, was built first in 1588 by the Portuguese, then extensively fortified by the Dutch during the 17th century from 1649 onwards.",
                  ))),
                ),

                // Temple of Tooth Image
                TravelCard(
                  title: "Temple of Tooth",
                  location: "Kandy, Sri Lanka",
                  image: "assets/images/kandy.png",
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DetailsScreen(
                    title: "Temple of Tooth",
                    location: "Kandy, Sri Lanka",
                    imagePath: "assets/images/kandy.png",
                    rating: 4.9,
                    description: "Sri Dalada Maligawa or the Temple of the Sacred Tooth Relic is a Buddhist temple in the city of Kandy, Sri Lanka. It is located in the royal palace complex of the former Kingdom of Kandy, which houses the relic of the tooth of the Buddha.",
                  ))),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}