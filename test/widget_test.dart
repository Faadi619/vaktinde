import 'package:flutter_test/flutter_test.dart';

import 'package:vaktinde/main.dart';

void main() {
  testWidgets('Vaktinde app builds', (WidgetTester tester) async {
    await tester.pumpWidget(const VaktindeApp());
    expect(find.byType(VaktindeApp), findsOneWidget);
  });
}
