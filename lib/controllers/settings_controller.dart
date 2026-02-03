import 'package:get/get.dart';
import '../services/storage_service.dart';
import '../routes/app_routes.dart';

class SettingsController extends GetxController {
  final StorageService _storage = StorageService();

  void clearAllData() async {
    await _storage.clearAll();
    Get.snackbar('Done', 'All data cleared');
    Get.offAllNamed(AppRoutes.login);
  }
}
