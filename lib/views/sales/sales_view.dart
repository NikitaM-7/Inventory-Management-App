import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/sales_controller.dart';
import '../../models/product_model.dart';

class SalesView extends StatelessWidget {
  SalesView({super.key});

  final SalesController controller = Get.find<SalesController>();

  @override
  Widget build(BuildContext context) {
    // ✅ SAFE argument read
    final ProductModel? product = Get.arguments;

    // ❌ Product null असेल तर message दाखव
    if (product == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Sales')),
        body: const Center(
          child: Text(
            'Please select a product to create bill',
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Sales')),
      body: Obx(() {
        if (controller.sales.isEmpty) {
          return const Center(child: Text('No bills generated'));
        }

        return ListView.builder(
          itemCount: controller.sales.length,
          itemBuilder: (context, index) {
            final bill = controller.sales[index];

            return Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: ListTile(
                title: Text(bill.productName),
                subtitle: Text(
                  'Qty: ${bill.quantity} | ₹${bill.price}',
                ),
                trailing: Text(
                  '₹${bill.total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          controller.createBill(
            productId: product.id,
            productName: product.name,
            quantity: 1,
            price: product.price,
          );
        },
      ),
    );
  }
}
