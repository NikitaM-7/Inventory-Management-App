class ProductModel {
  final String id;
  final String name;
  final String category;
  final double price;
  int stock;
  final DateTime createdAt;

  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.stock,
    required this.createdAt,
  });

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'price': price,
      'stock': stock,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Convert JSON to object
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      price: json['price'].toDouble(),
      stock: json['stock'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
