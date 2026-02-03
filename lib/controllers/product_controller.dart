import 'dart:convert';
import 'package:get/get.dart';
import '../models/product_model.dart';
import '../services/storage_service.dart';

class ProductController extends GetxController {
  final StorageService _storage = StorageService();

  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  // ---------------- LOAD ----------------
  Future<void> loadProducts() async {
    final data = await _storage.getProducts();
    if (data != null) {
      final List decoded = jsonDecode(data);
      products.value =
          decoded.map((e) => ProductModel.fromJson(e)).toList();
    }
  }

  // ---------------- ADD ----------------
  Future<void> addProduct(ProductModel product) async {
    products.add(product);
    await saveProducts();
  }

  // ---------------- UPDATE ----------------
  Future<void> updateProduct(ProductModel product) async {
    final index = products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      products[index] = product;
      await saveProducts();
    }
  }

  // ---------------- DELETE ----------------
  Future<void> deleteProduct(String id) async {
    products.removeWhere((p) => p.id == id);
    await saveProducts();
  }

  // ---------------- STOCK REDUCE ----------------
  Future<void> reduceStock(String id, int qty) async {
    final index = products.indexWhere((p) => p.id == id);
    if (index != -1) {
      products[index].stock -= qty;
      await saveProducts();
    }
  }

  // ---------------- LOW STOCK ----------------
  List<ProductModel> lowStockProducts() {
    return products.where((p) => p.stock < 10).toList();
  }

  // ---------------- SEARCH ----------------
  List<ProductModel> search(String query) {
    return products
        .where((p) =>
            p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  // ---------------- FILTER ----------------
  List<ProductModel> filterByCategory(String category) {
    return products.where((p) => p.category == category).toList();
  }

  // ---------------- SORT ----------------
  void sortByPrice() {
    products.sort((a, b) => a.price.compareTo(b.price));
    products.refresh(); // UI update
  }

  void sortByStock() {
    products.sort((a, b) => a.stock.compareTo(b.stock));
    products.refresh(); // UI update
  }

  // ---------------- SAVE ----------------
  Future<void> saveProducts() async {
    final encoded =
        jsonEncode(products.map((e) => e.toJson()).toList());
    await _storage.saveProducts(encoded);
  }
}
