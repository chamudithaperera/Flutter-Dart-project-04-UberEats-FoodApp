import 'package:flutter/material.dart';
import 'package:foodapp/homepage.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordHidden = true; // To control password visibility

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
                'Login',
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
                      color: Colors.black.withOpacity(0.2),
                      fontSize: 13,  // Decrease opacity for placeholder
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
                      color: Colors.black.withOpacity(0.2),
                      fontSize: 13, // Decrease opacity for placeholder
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
                        color: Colors.black.withOpacity(0.5),
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


              const SizedBox(height: 5),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    // Forgot password action
                  },
                  child: const Text('Forgot password?',
                  style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
                ),
              ),
              
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(
                height: 10,
              ),
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
                  width: double.infinity, // Ensures the button takes the full width of the parent container
                  child: OutlinedButton.icon(
                    icon: Image.asset(
                      'assets/google_icon.png',
                      width: 24,  // Adjust the icon size if needed
                    ),  
                    onPressed: () {
                      // Google login action
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black, 
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15), // Padding is set for vertical symmetry
                      side: const BorderSide(color: Colors.white), // White border for consistency
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),  // Rounded corners for a modern look
                      ),
                    ),
                    label: const Text(
                      'Login with Google',
                      style: TextStyle(fontSize: 13, color: Colors.black), // Text color matches the design
                    ),
                  ),
                ),
              ),


              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterScreen()),
                  );
                },
                child: const Text("Don't have an account? sign up",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
