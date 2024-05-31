import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterproject/presentation/screen/book_car.dart';
import 'package:flutterproject/presentation/screen/Payment.dart';
import 'package:flutterproject/data.dart';

void main() {
  testWidgets('BookCar displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BookCar(
          car: Car(
              model: 'Toyota', brand: 'Toyota', images: ['image1', 'image2'])),
    ));

    // Verify that the app bar is not displayed
    expect(find.byType(AppBar), findsNothing);

    // Verify that the back button is displayed
    expect(find.byIcon(Icons.keyboard_arrow_left), findsOneWidget);

    // Verify that the car model is displayed
    expect(find.text('Toyota'), findsOneWidget);

    // Verify that the car brand is displayed
    expect(find.text('Toyota'), findsOneWidget);

    // Verify that the images are displayed
    expect(find.byType(Image), findsNWidgets(2));

    // Verify that the page indicator is displayed
    expect(find.byType(PageView), findsOneWidget);

    // Verify that the specifications are displayed
    expect(find.text('SPECIFICATIONS'), findsOneWidget);

    // Verify that the book button is displayed
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('BookCar navigates to PaymentPage', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BookCar(
          car: Car(
              model: 'Toyota', brand: 'Toyota', images: ['image1', 'image2'])),
    ));

    // Tap on the book button
    await tester.tap(find.byType(ElevatedButton));

    // Verify that the PaymentPage is displayed
    expect(find.byType(PaymentPage), findsOneWidget);
  });
}
