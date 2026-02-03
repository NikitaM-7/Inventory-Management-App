import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/product_controller.dart';
import '../../models/product_model.dart';

class AddProductView extends StatelessWidget {
  AddProductView({super.key});

  final name = TextEditingController();
  final cat = TextEditingController();
  final price = TextEditingController();
  final stock = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final c = Get.find<ProductController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _field(name, 'Product Name', Icons.inventory),
            _field(cat, 'Category', Icons.category),
            _field(price, 'Price', Icons.currency_rupee),
            _field(stock, 'Stock', Icons.numbers),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text('Save Product'),
              onPressed: () {
                c.addProduct(ProductModel(
                  id: DateTime.now().toString(),
                  name: name.text,
                  category: cat.text,
                  price: double.parse(price.text),
                  stock: int.parse(stock.text),
                  createdAt: DateTime.now(),
                ));
                Get.back();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _field(TextEditingController c, String t, IconData i) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: c,
        decoration:
            InputDecoration(labelText: t, prefixIcon: Icon(i)),
      ),
    );
  }
}
