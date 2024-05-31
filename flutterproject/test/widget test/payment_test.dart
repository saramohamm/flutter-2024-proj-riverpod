import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterproject/presentation/screen/payment.dart';

void main() {
  testWidgets('Payment page displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      title: 'Car Rental App',
      home: PaymentPage(),
    ));

    // Verify that the app bar title is correct
    expect(find.text('Payment page'), findsOneWidget);

    // Verify that the payment information form is displayed
    expect(find.text('Enter Payment Information'), findsOneWidget);
    expect(find.text('acccount number'), findsOneWidget);
    expect(find.text('reciever account number'), findsOneWidget);
    expect(find.text('Amount (ETB)'), findsOneWidget);
    expect(find.text('payment password'), findsOneWidget);

    // Verify that the confirm payment button is displayed
    expect(find.text('Confirm Payment'), findsOneWidget);
  });

  testWidgets('Payment page handles form input', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      title: 'Car Rental App',
      home: PaymentPage(),
    ));

    // Enter payment information into the form
    await tester.enterText(
        find.bySemanticsLabel('acccount number'), '12345678');
    await tester.enterText(
        find.bySemanticsLabel('reciever account number'), '87654321');
    await tester.enterText(find.bySemanticsLabel('Amount (ETB)'), '1000');
    await tester.enterText(
        find.bySemanticsLabel('payment password'), 'password123');

    // Tap the confirm payment button
    await tester.tap(find.text('Confirm Payment'));

    // Verify that the payment confirmation dialog is displayed
    expect(find.text('Payment Confirmation'), findsOneWidget);
    expect(find.text('Payment confirmed successfully!'), findsOneWidget);
  });
}
