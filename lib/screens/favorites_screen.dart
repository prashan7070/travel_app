import 'package:flutter/material.dart';
import '../widgets/travel_card.dart'; 
import 'details_screen.dart';
import '../models/trip_model.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
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
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold), 
              ),
            ),
            const SizedBox(height: 10), 
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20), 
                child: favoriteTrips.isEmpty
                    ? const Center(
                        child: Text(
                          "No favorites yet. Start exploring!",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: favoriteTrips.length,
                        itemBuilder: (context, index) {
                          final trip = favoriteTrips[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: TravelCard(
                              title: trip.title,
                              location: trip.location,
                              image: trip.imagePath,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(trip: trip),
                                  ),
                                ).then((_) => setState(() {}));
                              },
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}