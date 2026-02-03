import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/product_controller.dart';
import '../../routes/app_routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<ProductController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Get.toNamed(AppRoutes.settings),
          )
        ],
      ),
      body: Obx(() {
        final totalProducts = c.products.length;
        final totalStock =
            c.products.fold<int>(0, (s, p) => s + p.stock);
        final lowStock = c.lowStockProducts();

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              children: [
                _statCard(
                  'Products',
                  totalProducts.toString(),
                  Icons.inventory_2,
                  const Color(0xFF38BDF8),
                ),
                const SizedBox(width: 12),
                _statCard(
                  'Total Stock',
                  totalStock.toString(),
                  Icons.bar_chart,
                  const Color(0xFF0EA5E9),
                ),
              ],
            ),

            const SizedBox(height: 28),

            const Text(
              'Low Stock Alerts',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            if (lowStock.isEmpty)
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('🎉 All products have enough stock'),
                ),
              )
            else
              ...lowStock.map(
                (p) => Card(
                  child: ListTile(
                    leading: const Icon(Icons.warning, color: Colors.red),
                    title: Text(p.name),
                    trailing: Text(
                      p.stock.toString(),
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
          ],
        );
      }),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _statCard(
      String title, String value, IconData icon, Color color) {
    return Expanded(
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(milliseconds: 500),
        builder: (_, v, child) =>
            Transform.scale(scale: v, child: child),
        child: Card(
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: Colors.white, size: 28),
                const SizedBox(height: 16),
                Text(
                  value,
                  style: const TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(title,
                    style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: const Color(0xFF38BDF8),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Products'),
        BottomNavigationBarItem(icon: Icon(Icons.point_of_sale), label: 'Sales'),
      ],
      onTap: (i) {
        if (i == 0) Get.toNamed(AppRoutes.addProduct);
        if (i == 1) Get.toNamed(AppRoutes.products);
        if (i == 2) Get.toNamed(AppRoutes.sales);
      },
    );
  }
}
