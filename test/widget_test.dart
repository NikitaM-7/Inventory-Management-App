import 'package:flutter_test/flutter_test.dart';
import 'package:inventory_management_app/main.dart';

void main() {
  testWidgets('App launches test', (WidgetTester tester) async {
    // Build app
    await tester.pumpWidget(const InventoryApp());

    // Verify splash screen text/icon exists
    expect(find.text('Inventory App'), findsOneWidget);
  });
}
