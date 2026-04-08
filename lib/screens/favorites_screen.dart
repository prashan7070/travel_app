import 'package:flutter/material.dart';
import '../widgets/travel_card.dart'; 
import 'details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10), 
              child: Text(
                "My Favorites",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold), // Font size update
              ),
            ),
            const SizedBox(height: 10), 
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20), 
                child: ListView(
                  children: [
                    
                    TravelCard(
                      title: "Blue Beach",
                      location: "Galle, Sri Lanka",
                      image: "assets/images/beach.png", 
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const DetailsScreen(
                            title: "Blue Beach",
                            location: "Galle, Sri Lanka",
                            imagePath: "assets/images/beach.png",
                            rating: 4.5,
                            description: "A gorgeous, secluded beach strip on the southern coast. Enjoy quiet sunbathing and fresh seafood while exploring the local reef structures around the coast.",
                          )),
                        );
                      },
                    ),
                    TravelCard(
                      title: "Tea Gardens",
                      location: "Nuwara Eliya, Sri Lanka",
                      image: "assets/images/tea_garden.png", 
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const DetailsScreen(
                            title: "Tea Gardens",
                            location: "Nuwara Eliya, Sri Lanka",
                            imagePath: "assets/images/tea_garden.png",
                            rating: 4.8,
                            description: "Breathtaking landscapes filled with lush green tea plantations. The chilly climate and misty mountains perfectly match a warm cup of pure Ceylon tea.",
                          )),
                        );
                      },
                    ),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}