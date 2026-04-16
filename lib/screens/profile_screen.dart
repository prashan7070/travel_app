import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Background cover
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blueAccent, Colors.lightBlue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                // Back button (Only shows when pushed from HomeScreen)
                if (Navigator.canPop(context))
                  Positioned(
                    top: 50,
                    left: 20,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
                      ),
                    ),
                  ),
                // Avatar
                Positioned(
                  bottom: -50,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            // Profile Info
            const Text(
              "Prashan Anupama",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "anupama@example.com",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),

            const SizedBox(height: 20),

            // Stats row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatItem("Places", "12"),
                  _buildStatItem("Reviews", "34"),
                  _buildStatItem("Followers", "1.2K"),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Menu Items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildMenuItem(Icons.person_outline, "Edit Profile"),
                  _buildMenuItem(Icons.favorite_border, "My Favorites"),
                  _buildMenuItem(Icons.payment, "Payment Methods"),
                  _buildMenuItem(Icons.settings_outlined, "Settings"),
                  const Divider(),
                  _buildMenuItem(Icons.logout, "Log Out", isDestructive: true),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String title, {
    bool isDestructive = false,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDestructive
              ? Colors.red.withOpacity(0.1)
              : Colors.blue.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isDestructive ? Colors.red : Colors.blueAccent,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: isDestructive ? Colors.red : Colors.black87,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: () {},
    );
  }
}
