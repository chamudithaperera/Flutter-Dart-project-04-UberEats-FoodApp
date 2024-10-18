import 'package:flutter/material.dart';
import 'edit_profile_dialog.dart';
import 'change_password_dialog.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = 'John Doe';
  String userEmail = 'johndoe@example.com';
  String userLocation = 'Western Province, Kalutara';
  String userContact = '+94 123 456 789';

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
            Text(
              'Western Province, Kalutara',
              style: TextStyle(fontSize: 13),
            ),
            Spacer(),
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile_image.png'), // Profile image
            ),
          ],
        ),
        backgroundColor: Color(0xFF06C167), // Green theme color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Profile Section
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile_image.png'), // Profile image
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.edit, color: Colors.white),
                      onPressed: () {
                        // Open image picker or edit image action
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                userName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                userEmail,
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
            SizedBox(height: 20),

            // Location and Contact Number
            _buildEditableField('Location', userLocation, Icons.location_on),
            SizedBox(height: 10),
            _buildEditableField('Contact', userContact, Icons.phone),
            SizedBox(height: 30),

            // Buttons
            Spacer(), // Push buttons to the bottom
            _buildActionButton('Settings', () {
              // Open Settings action
            }),
            SizedBox(height: 10),
            _buildActionButton('Change Password', () {
              _showChangePasswordDialog(context);
            }),
            SizedBox(height: 10),
            _buildActionButton('Logout', () {
              // Logout action
            }),
          ],
        ),
      ),
    );
  }

  // Editable field widget
  Widget _buildEditableField(String title, String value, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.edit, color: Color(0xFF06C167)), // Edit icon
          onPressed: () {
            _showEditDialog(title, value);
          },
        ),
      ],
    );
  }

  // Show edit dialog
  void _showEditDialog(String field, String currentValue) {
    showDialog(
      context: context,
      builder: (context) {
        return EditProfileDialog(
          field: field,
          currentValue: currentValue,
          onSave: (newValue) {
            setState(() {
              if (field == 'Location') {
                userLocation = newValue;
              } else if (field == 'Contact') {
                userContact = newValue;
              }
            });
          },
        );
      },
    );
  }

  // Action button
  Widget _buildActionButton(String title, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity, // Full width
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF06C167), // Green theme color
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(title),
      ),
    );
  }

  // Change Password Dialog
  void _showChangePasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return ChangePasswordDialog();
      },
    );
  }
}
