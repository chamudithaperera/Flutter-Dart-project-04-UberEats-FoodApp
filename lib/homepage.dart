import 'package:flutter/material.dart';
import 'pages/home_page.dart';      // Import HomePage
import 'pages/orders_page.dart';    // Import OrdersPage
import 'pages/messages_page.dart';  // Import MessagesPage
import 'pages/profile_page.dart';   // Import ProfilePage

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Track the selected tab index

  // List of pages corresponding to bottom navigation items
  final List<Widget> _pages = [
    HomePage(),
    OrdersPage(),
    MessagesPage(),
    ProfilePage(),
  ];

  // Change selected index on bottom navigation tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages, // Display the corresponding page
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color(0xFF06C167),
        unselectedItemColor: Color.fromARGB(255, 0, 75, 38),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
