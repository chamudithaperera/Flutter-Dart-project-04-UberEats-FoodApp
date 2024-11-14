import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isPasswordHidden = true;  // To control password visibility
  bool _isConfirmPasswordHidden = true;  // To control confirm password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF06C167),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Uber\nEats',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.1,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              const Text(
                'Signup',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 70, 93, 74).withOpacity(0.5), // Shadow with opacity
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // Shadow slightly below the text field
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.2), fontSize: 13,  // Decrease opacity for placeholder
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 70, 93, 74).withOpacity(0.5), // Shadow with opacity
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // Shadow slightly below the text field
                    ),
                  ],
                ),
                child: TextField(
                  obscureText: _isPasswordHidden,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.2), fontSize: 13  // Decrease opacity for placeholder
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black.withOpacity(0.5)
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordHidden = !_isPasswordHidden;  // Toggle password visibility
                        });
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 70, 93, 74).withOpacity(0.5), // Shadow with opacity
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // Shadow slightly below the text field
                    ),
                  ],
                ),
                child: TextField(
                  obscureText: _isConfirmPasswordHidden,
                  decoration: InputDecoration(
                    hintText: 'Confirm password',
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.2), fontSize: 13  // Decrease opacity for placeholder
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordHidden ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black.withOpacity(0.5)
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordHidden = !_isConfirmPasswordHidden;  // Toggle confirm password visibility
                        });
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 70, 93, 74).withOpacity(0.5), // Shadow with opacity
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // Shadow slightly below the text field
                    ),
                  ],
                ),
                child: SizedBox(
                  width: double.infinity, // Full width of the parent container
                  child: ElevatedButton(
                    onPressed: () {
                      // Signup button action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Signup',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 70, 93, 74).withOpacity(0.5), // Shadow with opacity
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // Shadow slightly below the text field
                    ),
                  ],
                ),
                child: SizedBox(
                  width: double.infinity, // Full width of the parent container
                  child: OutlinedButton.icon(
                    icon: Image.asset(
                      'assets/google_icon.png',
                      width: 24,  // Adjust the icon size if needed
                    ),  
                    onPressed: () {
                      // Google signup action
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black, 
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15), // Padding for vertical symmetry
                      side: const BorderSide(color: Colors.white), // White border for consistency
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),  // Rounded corners for modern look
                      ),
                    ),
                    label: const Text(
                      'Signup with Google',
                      style: TextStyle(fontSize: 13, color: Colors.black), // Text color matches the design
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Already have an account? Login', style: TextStyle(color: Colors.black),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
