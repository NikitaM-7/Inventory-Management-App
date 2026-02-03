import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import '../models/sale_model.dart';

class PdfService {
  static Future<File> generateBillPdf(SaleModel bill) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'INVOICE',
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text('Product : ${bill.productName}'),
              pw.Text('Quantity: ${bill.quantity}'),
              pw.Text('Price   : ₹${bill.price}'),
              pw.Text('Total   : ₹${bill.total}'),
              pw.SizedBox(height: 10),
              pw.Text('Date    : ${bill.date}'),
            ],
          );
        },
      ),
    );

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/bill_${bill.id}.pdf');
    await file.writeAsBytes(await pdf.save());

    return file;
  }
}
