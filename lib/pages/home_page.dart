import 'package:flutter/material.dart';
import '/widgets/search_bar.dart' as custom; // Custom SearchBar
import '/widgets/categories_section.dart'; // Import Categories Section
import '/widgets/popular_section.dart'; // Import Popular Section

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
        backgroundColor: Color(0xFF06C167),
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
      body: Container(

        color: Color(0xFFE0F7E9),
        child: SingleChildScrollView(
           // Make the body scrollable
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Morning,",
                style: TextStyle(color: Colors.black54,fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                "Chamuditha Perera",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
        ),
      )
    );
  }
}
