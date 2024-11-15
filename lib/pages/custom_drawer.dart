import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'profile_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF06C167),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/profile_image.png'),
                ),
                const SizedBox(height: 10),
                Text(
                  'Your Name',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'yourname@example.com',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: Text(
              'Home',
              style: GoogleFonts.roboto(fontSize: 16),
            ),
            onTap: () {
              Navigator.pop(context);
              // Navigate to home
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag_outlined),
            title: Text(
              'My Orders',
              style: GoogleFonts.roboto(fontSize: 16),
            ),
            onTap: () {
              Navigator.pop(context);
              // Already on orders page
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite_outline),
            title: Text(
              'Favorites',
              style: GoogleFonts.roboto(fontSize: 16),
            ),
            onTap: () {
              Navigator.pop(context);
              // Navigate to favorites
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on_outlined),
            title: Text(
              'Addresses',
              style: GoogleFonts.roboto(fontSize: 16),
            ),
            onTap: () {
              Navigator.pop(context);
              // Navigate to addresses
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment_outlined),
            title: Text(
              'Payment Methods',
              style: GoogleFonts.roboto(fontSize: 16),
            ),
            onTap: () {
              Navigator.pop(context);
              // Navigate to payment methods
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: Text(
              'Settings',
              style: GoogleFonts.roboto(fontSize: 16),
            ),
            onTap: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              // Navigate to settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: Text(
              'Help & Support',
              style: GoogleFonts.roboto(fontSize: 16),
            ),
            onTap: () {
              Navigator.pop(context);
              // Navigate to help
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: Text(
              'Logout',
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: Colors.red,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              // Handle logout
            },
          ),
        ],
      ),
    );
  }
}