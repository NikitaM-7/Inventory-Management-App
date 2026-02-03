import 'package:get/get.dart';
import '../models/sale_model.dart';
import '../controllers/product_controller.dart';

class SalesController extends GetxController {
  final ProductController productController =
      Get.find<ProductController>();

  // In-memory sales list
  var sales = <SaleModel>[].obs;

  // CREATE BILL
  void createBill({
    required String productId,
    required String productName,
    required int quantity,
    required double price,
  }) {
    final bill = SaleModel(
      id: DateTime.now().toString(),
      productId: productId, // ✅ FIX (line 19 error solved)
      productName: productName,
      quantity: quantity,
      price: price,
      total: quantity * price,
      date: DateTime.now(),
    );

    sales.add(bill);
    productController.reduceStock(productId, quantity);
  }

  // TOTAL SALES
  double totalSalesAmount() {
    return sales.fold<double>(
      0,
      (sum, bill) => sum + bill.total,
    );
  }
}
