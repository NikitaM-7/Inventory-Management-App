import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/product_controller.dart';
import '../../routes/app_routes.dart';
import '../../models/product_model.dart';

class ProductListView extends StatelessWidget {
  ProductListView({super.key});

  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Obx(() {
        if (controller.products.isEmpty) {
          return const Center(
            child: Text('No products added'),
          );
        }

        return ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final ProductModel p = controller.products[index];
            final bool lowStock = p.stock < 10;

            return Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: ListTile(
                // ✅ SALES ला product pass
                onTap: () {
                  Get.toNamed(
                    AppRoutes.sales,
                    arguments: p,
                  );
                },

                leading: Icon(
                  Icons.inventory,
                  color: lowStock ? Colors.red : Colors.green,
                ),

                title: Text(p.name),

                subtitle: Text(
                  'Stock: ${p.stock} | ₹${p.price}',
                  style: lowStock
                      ? const TextStyle(color: Colors.red)
                      : null,
                ),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Get.toNamed(
                          AppRoutes.editProduct,
                          arguments: p,
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        controller.deleteProduct(p.id);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
