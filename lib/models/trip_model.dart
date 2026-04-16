class Trip {
  final String title;
  final String location;
  final String imagePath;
  final double rating;
  final String description;

  Trip({
    required this.title,
    required this.location,
    required this.imagePath,
    required this.rating,
    required this.description,
  });
}

// Global list to store favorite trips
List<Trip> favoriteTrips = [];
