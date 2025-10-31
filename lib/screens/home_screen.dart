import 'package:flutter/material.dart';
// 1. Import the placeholder screens for navigation
import 'login_screen.dart'; 
import 'register_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // NOTE: The _showMessage function is no longer needed since we are navigating.
  // We can remove it, but I'll keep the class clean without the placeholder function.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Delivery App'),
        backgroundColor: Colors.orange, // A common color for food apps
        actions: [
          // 🛒 Cart Button in the AppBar - NOW NAVIGATES
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to the Cart Screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center items vertically
          children: <Widget>[
            // --- Title/Welcome Message ---
            const Text(
              'Welcome! Start your order.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50), // Spacing

            // --- Login Button - NOW NAVIGATES ---
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the Login Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20), // Spacing

            // --- Register Button (Create Account) - NOW NAVIGATES ---
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the Register Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  'Create Account',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
