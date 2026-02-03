import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key}); // ✅ non-const constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // -------- APP INFO --------
          Card(
            child: ListTile(
              leading: const Icon(Icons.inventory_2),
              title: const Text('Inventory Management App'),
              subtitle: const Text('Version 1.0.0'),
            ),
          ),

          const SizedBox(height: 16),

          // -------- LOGOUT --------
          Card(
            child: ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout'),
              subtitle: const Text('Sign out from application'),
              onTap: () {
                Get.defaultDialog(
                  title: 'Confirm Logout',
                  middleText: 'Are you sure you want to logout?',
                  textConfirm: 'Yes',
                  textCancel: 'No',
                  confirmTextColor: Colors.white,
                  onConfirm: () {
                    Get.back(); // close dialog
                    Get.offAllNamed(AppRoutes.login);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

