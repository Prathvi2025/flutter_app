
import 'package:flutter/material.dart';
import '../models/food_item.dart';
import '../services/firestore_service.dart';
import '../widgets/food_item_card.dart';

class MainMenuScreen extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // TODO: Navigate to the Cart Screen
            },
          ),
        ],
      ),
      body: StreamBuilder<List<FoodItem>>(
        stream: _firestoreService.getFoodItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No food items found.'));
          }

          // Data loaded successfully, display the list
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              FoodItem item = snapshot.data![index];
              return FoodItemCard(item: item);
            },
          );
        },
      ),
    );
  }
}