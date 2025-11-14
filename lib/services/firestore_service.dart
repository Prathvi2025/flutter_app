
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/food_item.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Stream to listen for real-time updates of the food list
  Stream<List<FoodItem>> getFoodItems() {
    return _db.collection('food_item').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return FoodItem.fromFirestore(doc.data(), doc.id);
      }).toList();
    });
  }
}