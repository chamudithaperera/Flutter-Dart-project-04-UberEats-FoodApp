import 'package:flutter/material.dart';
import 'package:foodapp/pages/custom_drawer.dart';
import '/widgets/search_bar.dart' as custom;
import '/widgets/categories_section.dart';
import '/widgets/popular_section.dart';
import 'location_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LocationService _locationService = LocationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Row(
          children: [
            const Icon(Icons.location_on),
            const SizedBox(width: 5),
            Expanded(
              child: ListenableBuilder(
                listenable: _locationService,
                builder: (context, child) {
                  return Text(
                    _locationService.currentAddress,
                    style: const TextStyle(fontSize: 13),
                    overflow: TextOverflow.ellipsis,
                  );
                },
              ),
            ),
            const CircleAvatar(
              backgroundImage: AssetImage('assets/profile_image.png'),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF06C167),
      ),
      drawer: const CustomDrawer(),
      body: Container(
        color: Colors.grey[50],
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Morning,",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      "Chamuditha Perera",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const custom.SearchBar(),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              CategoriesSection(),
              const SizedBox(height: 24),
              PopularSection(),
            ],
          ),
        ),
      ),
    );
  }
}