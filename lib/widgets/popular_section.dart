import 'package:flutter/material.dart';

class PopularSection extends StatelessWidget {
  final List<Map<String, dynamic>> popularItems = [
    {
      'name': 'Spicy Noodles',
      'image': 'assets/noodles.png',
      'rating': 4.8,
      'restaurants': 20
    },
    {
      'name': 'Shrimp Pasta',
      'image': 'assets/shrimp_pasta.png',
      'rating': 4.7,
      'restaurants': 13
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title and More Button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // Action to see more popular items
                },
                child: Text('More'),
              ),
            ],
          ),
        ),
        // Popular Items List
        SizedBox(
          height: 250, // Total height for each card (image + texts)
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: popularItems.length,
            itemBuilder: (context, index) {
              return Container(
                width: 180, // Adjusted width for each card
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image Section with Rating Overlayed at Bottom-Left
                      Expanded(
                        flex: 75, // 75% of the vertical space is for the image
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                              child: Image.asset(
                                popularItems[index]['image']!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            // Rating Positioned at Bottom-Left of the Image
                            Positioned(
                              bottom: 8,
                              left: 8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.black54, // Semi-transparent background
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '${popularItems[index]['rating']}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 14,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Name and Restaurants Information (25% of vertical space)
                      Expanded(
                        flex: 25, // 25% of the vertical space for texts
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                popularItems[index]['name']!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Found in ${popularItems[index]['restaurants']} Restaurants',
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
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
