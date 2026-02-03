import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/sales_controller.dart';
import '../../services/pdf_service.dart';

class BillSummaryView extends StatelessWidget {
  BillSummaryView({super.key}); // non-const

  final SalesController controller = Get.find<SalesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Summary'),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: () async {
              if (controller.sales.isEmpty) return;
              await PdfService.generateBillPdf(
                controller.sales.last,
              );
            },
          )
        ],
      ),
      body: Obx(() {
        if (controller.sales.isEmpty) {
          return const Center(child: Text('No sales'));
        }

        final total = controller.totalSalesAmount();

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.sales.length,
                itemBuilder: (context, index) {
                  final bill = controller.sales[index];
                  return ListTile(
                    title: Text(bill.productName),
                    trailing: Text(
                      '₹${bill.total.toStringAsFixed(2)}',
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.blue.shade50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Grand Total',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '₹${total.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
