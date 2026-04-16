import 'package:flutter/material.dart';
import '../models/trip_model.dart';
import '../widgets/circular_button.dart';

class DetailsScreen extends StatefulWidget {
  final Trip trip;

  const DetailsScreen({super.key, required this.trip});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    bool isFav = favoriteTrips.any((element) => element.title == widget.trip.title);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: widget.trip.imagePath.startsWith('http')
                ? Image.network(widget.trip.imagePath, height: 350, fit: BoxFit.cover)
                : Image.asset(widget.trip.imagePath, height: 350, fit: BoxFit.cover),
          ),
          
          // Back Button & Favorite Icon
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircularButton(
                  icon: Icons.arrow_back_ios_new,
                  iconSize: 20,
                  iconColor: Colors.black,
                  backgroundColor: Colors.white.withValues(alpha: 0.8),
                  onTap: () => Navigator.pop(context),
                ),
                CircularButton(
                  icon: isFav ? Icons.favorite : Icons.favorite_border,
                  iconSize: 22,
                  iconColor: Colors.redAccent,
                  backgroundColor: Colors.white.withValues(alpha: 0.8),
                  onTap: () {
                    setState(() {
                      if (isFav) {
                        favoriteTrips.removeWhere((element) => element.title == widget.trip.title);
                      } else {
                        favoriteTrips.add(widget.trip);
                      }
                    });
                  },
                ),
              ],
            ),
          ),

          // Content Container overlapping the image
          Positioned(
            top: 320,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.trip.title,
                          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.orange, size: 22),
                          const SizedBox(width: 4),
                          Text(
                            widget.trip.rating.toString(),
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.blueAccent, size: 18),
                      const SizedBox(width: 5),
                      Text(
                        widget.trip.location,
                        style: const TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        widget.trip.description,
                        style: const TextStyle(fontSize: 15, color: Colors.black54, height: 1.5),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
          ),
          child: const Text(
            "Book Trip Now",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}