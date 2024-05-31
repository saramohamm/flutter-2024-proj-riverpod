import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterproject/presentation/screen/WelcomeScreen.dart';
import 'package:flutterproject/presentation/screen/loginScreen.dart';
import 'package:flutterproject/presentation/screen/regScreen.dart';

void main() {
  testWidgets('WelcomeScreen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: WelcomeScreen(),
    ));

    // Verify that the gradient background is displayed
    expect(find.byType(LinearGradient), findsOneWidget);

    // Verify that the welcome text is displayed
    expect(find.text('Discover Your Journey \nWelcome To Our Car Rental App'),
        findsOneWidget);

    // Verify that the sign in button is displayed
    expect(find.byType(GestureDetector), findsNWidgets(2));
    expect(find.text('SIGN IN'), findsOneWidget);

    // Verify that the sign up button is displayed
    expect(find.text('SIGN UP'), findsOneWidget);
  });

  testWidgets(
      'WelcomeScreen navigates to loginScreen when sign in button is tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: WelcomeScreen(),
    ));

    // Tap the sign in button
    await tester.tap(find.text('SIGN IN'));

    // Verify that the loginScreen is displayed
    expect(find.byType(loginScreen), findsOneWidget);
  });

  testWidgets(
      'WelcomeScreen navigates to RegScreen when sign up button is tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: WelcomeScreen(),
    ));

    // Tap the sign up button
    await tester.tap(find.text('SIGN UP'));

    // Verify that the RegScreen is displayed
    expect(find.byType(RegScreen), findsOneWidget);
  });
}
