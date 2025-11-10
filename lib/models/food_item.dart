
class FoodItem {
  final String id;
  final String name;
  final double price;
  final String description;
  final String imageUrl;

  FoodItem({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });

  // Factory constructor to create a FoodItem from a Firestore document
  factory FoodItem.fromFirestore(Map<String, dynamic> data, String id) {
    return FoodItem(
      id: id,
      name: data['name'] ?? 'Unknown Item',
      // Firestore stores numbers as 'num', so cast it to double safely
      price: (data['price'] as num?)?.toDouble() ?? 0.0,
      description: data['description'] ?? 'No description.',
      imageUrl: data['imageUrl'] ?? '',
    );
  }
}