import 'package:flutter_test/flutter_test.dart';
import 'package:vaqt/main.dart';

void main() {
  testWidgets('Vaqt app builds', (WidgetTester tester) async {
    await tester.pumpWidget(const VaqtApp());
    expect(find.byType(VaqtApp), findsOneWidget);
  });
}
