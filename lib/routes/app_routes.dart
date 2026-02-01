import 'package:get/get.dart';
import '../views/auth/login_view.dart';
import '../views/auth/register_view.dart';
import '../views/auth/splash_view.dart';
import '../views/dashboard/home_view.dart';
import '../views/product/add_product_view.dart';
import '../views/product/edit_product_view.dart';
import '../views/sales/sales_view.dart';
import '../views/settings/settings_view.dart';

class AppRoutes {
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const addProduct = '/add-product';
  static const editProduct = '/edit-product';
  static const sales = '/sales';
  static const settings = '/settings';

  static final routes = [
    GetPage(name: splash, page: () => const SplashView()),
    GetPage(name: login, page: () => const LoginView()),
    GetPage(name: register, page: () => const RegisterView()),
    GetPage(name: home, page: () => const HomeView()),
    GetPage(name: addProduct, page: () => const AddProductView()),
    GetPage(name: editProduct, page: () => const EditProductView()),
    GetPage(name: sales, page: () => const SalesView()),
    GetPage(name: settings, page: () => const SettingsView()),
  ];
}
