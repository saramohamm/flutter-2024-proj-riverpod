import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterproject/presentation/screen/book_car.dart';
import 'package:flutterproject/presentation/screen/Payment.dart';
import 'package:flutterproject/data.dart';

void main() {
  testWidgets('BookCar Widget Test', (WidgetTester tester) async {
    // Create a mock Car object for testing
    final car = Car(
      model: 'Test Model',
      brand: 'Test Brand',
      images: ['test_image_path'],
    );

    // Build the BookCar widget
    await tester.pumpWidget(MaterialApp(home: BookCar(car: car)));

    // Verify that the title and back button are rendered
    expect(find.text("Test Model"), findsOneWidget);
    expect(find.byIcon(Icons.keyboard_arrow_left), findsOneWidget);

    // Tap on the back button
    await tester.tap(find.byIcon(Icons.keyboard_arrow_left));
    await tester.pumpAndSettle(); // Wait for navigation to complete

    // Verify that navigation back to the previous screen occurred
    expect(find.byType(BookCar), findsNothing);

    // Verify that tapping on the "Book this car" button navigates to the Payment screen
    await tester.tap(find.text("Book this car"));
    await tester.pumpAndSettle(); // Wait for navigation to complete

    // Verify that navigation to the Payment screen occurred
    expect(find.byType(PaymentPage), findsOneWidget);
  });
}
