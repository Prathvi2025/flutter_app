import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// 1. IMPORT YOUR HOME SCREEN (assuming it's in lib/screens/home_screen.dart)
import 'screens/home_screen.dart';

// The main function is now asynchronous to initialize Firebase
void main() async {
  // Ensures Flutter's binding is ready before calling native code (Firebase)
  WidgetsFlutterBinding.ensureInitialized();

  // 2. INITIALIZE FIREBASE
  try {
    await Firebase.initializeApp();
  } catch (e) {
    // Optional: Add logging or error handling here if Firebase initialization fails
    print("Firebase initialization error: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Change the title to reflect your app
      title: 'Food Delivery App',
      theme: ThemeData(
        // Set a color scheme appropriate for a food app (e.g., orange or red)
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      
      // 3. SET THE HOME SCREEN
      // We replace the old MyHomePage with your new HomeScreen
      home: const HomeScreen(), 
    );
  }
}

// ⚠️ IMPORTANT: You must delete or comment out the following two classes 
// (MyHomePage and _MyHomePageState) from your main.dart file 
// after pasting the above code, as they are no longer used!
/* class MyHomePage extends StatefulWidget { ... }
class _MyHomePageState extends State<MyHomePage> { ... }
*/