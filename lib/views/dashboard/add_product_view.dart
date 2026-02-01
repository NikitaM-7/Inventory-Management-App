import 'package:flutter/material.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(decoration: const InputDecoration(labelText: 'Product Name')),
            const SizedBox(height: 10),
            TextField(decoration: const InputDecoration(labelText: 'Category')),
            const SizedBox(height: 10),
            TextField(decoration: const InputDecoration(labelText: 'Price')),
            const SizedBox(height: 10),
            TextField(decoration: const InputDecoration(labelText: 'Stock')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text('Save Product')),
          ],
        ),
      ),
    );
  }
}
