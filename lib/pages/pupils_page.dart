import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, 
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Pupils',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          _buildTopButton(icon: Icons.info_outline, color: Colors.purpleAccent),
          const SizedBox(width: 8),
          _buildTopButton(icon: Icons.add, color: Colors.purpleAccent),
          const SizedBox(width: 16),
        ],
      ),
      body: const Center(
        child: Text(
          'There are no pupils yet.',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
 
  // Helper widget for the top right buttons
  Widget _buildTopButton({required IconData icon, required Color color}) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(
        icon,
        color: color,
        size: 24,
      ),
    );
  }
}
 