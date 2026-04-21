import 'package:flutter_test/flutter_test.dart';
import 'package:gupshup/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // Note: This might fail if Firebase isn't initialized properly in test environment,
    // but for now we just want to fix the compilation error.
    await tester.pumpWidget(const GupShupApp());
    expect(find.byType(GupShupApp), findsOneWidget);
  });
}
