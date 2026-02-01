import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration: const Duration(milliseconds: 500),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 30 * (1 - value)),
                child: child,
              ),
            );
          },
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Product ID
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Product ID',
                    prefixIcon: Icon(Icons.qr_code),
                  ),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Enter product id' : null,
                ),
                const SizedBox(height: 12),

                // Product Name
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Product Name',
                    prefixIcon: Icon(Icons.inventory_2),
                  ),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Enter product name' : null,
                ),
                const SizedBox(height: 12),

                // Category
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    prefixIcon: Icon(Icons.category),
                  ),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Enter category' : null,
                ),
                const SizedBox(height: 12),

                // Price
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    prefixIcon: Icon(Icons.currency_rupee),
                  ),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Enter price' : null,
                ),
                const SizedBox(height: 12),

                // Stock Quantity
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Stock Quantity',
                    prefixIcon: Icon(Icons.storage),
                  ),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Enter stock quantity' : null,
                ),
                const SizedBox(height: 24),

                // Save Button
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  icon: const Icon(Icons.save),
                  label: const Text(
                    'Save Product',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Controller logic later (PDF: MVC)
                      Get.snackbar(
                        'Success',
                        'Product added successfully',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green.shade100,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
