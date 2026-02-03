import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_routes.dart';

// Controllers
import 'controllers/auth_controller.dart';
import 'controllers/product_controller.dart';
import 'controllers/sales_controller.dart';
import 'controllers/settings_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Register controllers
  Get.put<AuthController>(AuthController(), permanent: true);
  Get.put<ProductController>(ProductController(), permanent: true);
  Get.put<SalesController>(SalesController(), permanent: true);
  Get.put<SettingsController>(SettingsController(), permanent: true);

  runApp(const InventoryApp());
}

class InventoryApp extends StatelessWidget {
  const InventoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventory Management',
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.routes,
    );
  }
}
