import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          // Search bar
          Expanded(
            child: Container(
              height: 50, // Adjust height here
              decoration: BoxDecoration(
                color: Colors.grey.shade200, // Background color for search bar
                borderRadius: BorderRadius.circular(5), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3), // Shadow color
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for lunch',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade600, // Hint text color
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600, // Icon color
                  ),
                  border: InputBorder.none, // Remove the border
                  contentPadding: EdgeInsets.symmetric(vertical: 15), // Adjust padding
                ),
                style: TextStyle(color: Colors.black), // Text color
              ),
            ),
          ),
          SizedBox(width: 10), // Space between search bar and filter button
          // Filter button
          Container(
            height: 50, // Adjust height here
            width: 50, // Adjust width to make it square
            decoration: BoxDecoration(
              color: Colors.grey.shade200, // Background color for filter button
              borderRadius: BorderRadius.circular(10), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3), // Shadow color
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // Shadow position
                ),
              ],
            ),
            child: Icon(
              Icons.tune, // Filter icon
              color: Colors.grey.shade600, // Icon color
            ),
          ),
        ],
      ),
    );
  }
}
