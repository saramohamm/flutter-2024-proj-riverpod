import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterproject/presentation/screen/AddCarPage.dart';

void main() {
  testWidgets('AddCarPage displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: AddCarPage(),
    ));

    // Verify that the app bar is displayed
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Add Car'), findsOneWidget);

    // Verify that the text fields are displayed
    expect(find.byType(TextField), findsNWidgets(7));

    // Verify that the elevated button is displayed
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Add Car'), findsOneWidget);
  });

  testWidgets('AddCarPage updates car fields', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: AddCarPage(),
    ));

    // Enter values into the text fields
    await tester.enterText(
        find.byType(TextField).at(0), 'https://example.com/photo');
    await tester.enterText(find.byType(TextField).at(1), 'Red');
    await tester.enterText(find.byType(TextField).at(2), 'Automatic');
    await tester.enterText(find.byType(TextField).at(3), '5');
    await tester.enterText(find.byType(TextField).at(4), 'V6');
    await tester.enterText(find.byType(TextField).at(5), '120');
    await tester.enterText(find.byType(TextField).at(6), '180');

    // Verify that the fields have been updated
    expect(
        find.byType(AddCarPage).first._photoAsset, 'https://example.com/photo');
    expect(find.byType(AddCarPage).first._color, 'Red');
    expect(find.byType(AddCarPage).first._gearbox, 'Automatic');
    expect(find.byType(AddCarPage).first._seat, 5);
    expect(find.byType(AddCarPage).first._motor, 'V6');
    expect(find.byType(AddCarPage).first._speed, 120);
    expect(find.byType(AddCarPage).first._topSpeed, 180);
  });

  testWidgets('AddCarPage navigates back', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: AddCarPage(),
    ));

    // Tap on the back button
    await tester.pressBack();

    // Verify that the previous screen is displayed
    expect(find.byType(YourPreviousScreen), findsOneWidget);
  });
}
