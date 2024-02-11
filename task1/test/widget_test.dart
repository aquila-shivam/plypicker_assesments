import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plypicker/main.dart';

void main() {
  testWidgets('Login and Register Widgets Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that Login Page is rendered initially.
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);

    // Tap on Register button and verify if Register Page is rendered.
    await tester.tap(find.text('Register'));
    await tester.pumpAndSettle();
    expect(find.text('Register'), findsOneWidget);
    expect(find.text('Login'), findsNothing);

    // Enter username and password in Register Page and tap on Register button.
    await tester.enterText(find.byType(TextField).at(0), 'test_user');
    await tester.enterText(find.byType(TextField).at(1), 'test_password');
    await tester.tap(find.text('Register'));
    await tester.pumpAndSettle();

    // Verify if we're back to Login Page.
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);

    // Enter username and password in Login Page and tap on Login button.
    await tester.enterText(find.byType(TextField).at(0), 'test_user');
    await tester.enterText(find.byType(TextField).at(1), 'test_password');
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Verify if successful login navigates to the next screen (you can adjust this test according to your app flow).
    // Here, I'm just verifying that login doesn't navigate away from the login page.
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);
  });
}
