import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        // Center the entire body content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Vertically space out the content
          crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
          children: [
            const SizedBox(height: 180), // Optional space to push the text a bit lower if needed
            const Text(
              'Home',
              style: TextStyle(
                fontSize: 50, // Larger font size
                fontWeight: FontWeight.bold, // Bold text
                fontFamily: 'Roboto', // Custom font
                color: Colors.black, // Text color set to black
              ),
            ),
            const Spacer(), // Pushes the Logout button to the bottom
            // Logout Button aligned at the bottom
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const LoginPage()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize:
                      const Size(double.infinity, 50), // Full width button
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                  backgroundColor: Colors.red, // Button color
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
            const SizedBox(
                height: 20), // Add space between button and screen edge
          ],
        ),
      ),
    );
  }
}