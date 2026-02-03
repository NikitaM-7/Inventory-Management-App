import 'package:get/get.dart';

// Auth
import '../views/auth/splash_view.dart';
import '../views/auth/login_view.dart';
import '../views/auth/register_view.dart';

// Dashboard
import '../views/dashboard/home_view.dart';

// Product
import '../views/product/add_product_view.dart';
import '../views/product/edit_product_view.dart';
import '../views/product/product_list_view.dart';

// Sales
import '../views/sales/sales_view.dart';
import '../views/sales/bill_summary_view.dart';

// Settings
import '../views/settings/settings_view.dart';

class AppRoutes {
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';

  static const addProduct = '/add-product';
  static const editProduct = '/edit-product';
  static const products = '/products';

  static const sales = '/sales';
  static const billSummary = '/bill-summary';
  static const settings = '/settings';

  static final routes = [
    GetPage(name: splash, page: () => SplashView()),
    GetPage(name: login, page: () => LoginView()),
    GetPage(name: register, page: () => RegisterView()),
    GetPage(name: home, page: () => HomeView()),

    GetPage(name: addProduct, page: () => AddProductView()),
    GetPage(name: editProduct, page: () => EditProductView()),
    GetPage(name: products, page: () => ProductListView()),

    GetPage(name: sales, page: () => SalesView()),
    GetPage(name: billSummary, page: () => BillSummaryView()),

    GetPage(name: settings, page: () => SettingsView()),
  ];
}
