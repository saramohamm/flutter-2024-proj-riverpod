import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterproject/presentation/screen/UpdateCarPage.dart';

void main() {
  testWidgets('UpdateCarPage displays correctly', (WidgetTester tester) async {
    final Car car = Car(name: 'Test Car');

    await tester.pumpWidget(MaterialApp(
      home: UpdateCarPage(car: car),
    ));

    // Verify that the app bar is displayed
    expect(find.byType(AppBar), findsOneWidget);

    // Verify that the title is displayed
    expect(find.text('Update Car'), findsOneWidget);

    // Verify that the car name is displayed
    expect(find.text('Car: Test Car'), findsOneWidget);

    // Verify that the text fields are displayed
    expect(find.byType(TextField), findsNWidgets(7));

    // Verify that the update button is displayed
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Verify that the update button has the correct text
    expect(find.text('Update Car'), findsOneWidget);
  });

  testWidgets('UpdateCarPage updates car fields correctly',
      (WidgetTester tester) async {
    final Car car = Car(name: 'Test Car');

    await tester.pumpWidget(MaterialApp(
      home: UpdateCarPage(car: car),
    ));

    // Enter values into the text fields
    await tester.enterText(
        find.byKey(Key('photo')), 'https://example.com/photo');
    await tester.enterText(find.byKey(Key('color')), 'Red');
    await tester.enterText(find.byKey(Key('gearbox')), 'Automatic');
    await tester.enterText(find.byKey(Key('seat')), '5');
    await tester.enterText(find.byKey(Key('motor')), 'V6');
    await tester.enterText(find.byKey(Key('speed')), '120');
    await tester.enterText(find.byKey(Key('topSpeed')), '180');

    // Verify that the fields have been updated correctly
    expect(find.byKey(Key('photo')).text, 'https://example.com/photo');
    expect(find.byKey(Key('color')).text, 'Red');
    expect(find.byKey(Key('gearbox')).text, 'Automatic');
    expect(find.byKey(Key('seat')).text, '5');
    expect(find.byKey(Key('motor')).text, 'V6');
    expect(find.byKey(Key('speed')).text, '120');
    expect(find.byKey(Key('topSpeed')).text, '180');
  });
}
