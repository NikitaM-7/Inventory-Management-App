import 'package:get/get.dart';

class AuthController extends GetxController {
  void login(String email, String password) {
    if (email == 'admin@gmail.com' && password == 'admin123') {
      Get.offAllNamed('/home');
    } else {
      Get.snackbar(
        'Login Failed',
        'Invalid email or password',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void logout() {
    Get.offAllNamed('/login');
  }
}
