import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'name': 'Breakfast', 'image': 'assets/breakfast.png'},
    {'name': 'Lunch', 'image': 'assets/lunch.png'},
    {'name': 'Dinner', 'image': 'assets/dinner.png'},
    {'name': 'Others', 'image': 'assets/others.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row for Categories and See More
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // Action to see more categories
                },
                child: Text('More', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0) ),),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),

        Container(
          height: 140, // Adjust height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF06C167), // Green background color
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 70, 93, 74).withOpacity(0.5), // Shadow with opacity
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow slightly below the text field
                      ),
                    ], // Rounded corners for the card
                  ),
                  
                  width: 160, // Adjust width to give more space
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Stack(
                    children: [
                      // Category Name at Top-Left
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            categories[index]['name']!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      // Cropped Image Inside the Container
                      Positioned(
                        bottom: 0,   // Position at the bottom of the container
                        right: 0,    // Position at the right of the container
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0), // Apply rounded corners to the image
                          child: Container(
                            width: 120,  // Adjust the size to fit within the container
                            height: 120, // Adjust the size to fit within the container
                            child: Image.asset(
                              categories[index]['image']!,
                              fit: BoxFit.cover, // Ensure the image covers the space without overflow
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
