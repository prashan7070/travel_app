
import 'package:flutter/material.dart';

class TravelCard extends StatelessWidget {
  final String title;
  final String location;
  final String image;
  final double? width; 
  final VoidCallback onTap;

  const TravelCard({
    super.key,
    required this.title,
    required this.location,
    required this.image,
    this.width, 
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,  // Allow custom width or take full width
        margin: const EdgeInsets.only(right: 15, bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: image.startsWith('http')
                  ? Image.network(
                      image,
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: _buildErrorPlaceholder,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          height: 160,
                          width: double.infinity,
                          color: Colors.grey[200],
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    )
                  : Image.asset(
                      image,
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: _buildErrorPlaceholder,
                    ),
            ),
            // Info Section
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title, 
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.blue),
                      const SizedBox(width: 4),
                      Text(
                        location, 
                        style: const TextStyle(color: Colors.grey, fontSize: 14)
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorPlaceholder(BuildContext context, Object error, StackTrace? stackTrace) {
    return Container(
      height: 160,
      width: double.infinity,
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.broken_image, color: Colors.grey, size: 40),
          SizedBox(height: 8),
          Text("Image not available", style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}