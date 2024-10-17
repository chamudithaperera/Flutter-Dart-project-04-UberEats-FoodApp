import 'package:flutter/material.dart';
import '/widgets/search_bar.dart' as custom; // Custom SearchBar
import '/widgets/categories_section.dart'; // Import Categories Section
import '/widgets/popular_section.dart'; // Import Popular Section

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// Track the selected index for bottom navigation

  // Method to handle bottom navigation tap
  void _onItemTapped(int index) {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Sidebar menu action
          },
        ),
        title: Row(
          children: [
            Icon(Icons.location_on),
            SizedBox(width: 5),
            Text('Western Province, Kalutara', style: TextStyle(fontSize: 13),), // Update location text accordingly
            Spacer(),
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile_image.png'), // Profile image
            ),
          ],
        ),
      ),
      body: SingleChildScrollView( // Make the body scrollable
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning,\nChamuditha Perera",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // Custom SearchBar with Filter Button
            custom.SearchBar(),

            SizedBox(height: 24),

            // Categories Section
            CategoriesSection(),

            SizedBox(height: 24),

            // Popular Section
            PopularSection(), // Ensure this section is scrollable
          ],
        ),
      )


      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      //   selectedItemColor: Color(0xFF06C167),
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_bag),
      //       label: 'Orders',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.message),
      //       label: 'Messages',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
    );
  }
}
