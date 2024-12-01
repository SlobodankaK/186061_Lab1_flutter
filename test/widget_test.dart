import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Clothing list displays items', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('LFC Nike Mens 24/25 Home Match Jersey'), findsOneWidget);
    expect(find.text('LFC Nike Mens 24/25 Home Match Shorts'), findsOneWidget);
    expect(find.text('LFC Nike 24/25 Home Socks'), findsOneWidget);
    expect(find.text('LFC Womens Rain Jacket Black'), findsOneWidget);
    expect(find.text('LFCW Adults Crest Hoody Red'), findsOneWidget);
  });

  testWidgets('Navigate to Clothing Detail Screen when item is tapped', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.text('LFC Nike Mens 24/25 Home Match Jersey'));
    await tester.pumpAndSettle();

    expect(find.text('LFC Nike Mens 24/25 Home Match Jersey'), findsOneWidget);
    expect(find.text('Price: \$89.99'), findsOneWidget);
    expect(find.text('Official LFC Nike Men\'s 24/25 Home Match Jersey.'), findsOneWidget);
  });

  testWidgets('Verify image is displayed in detail screen', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.text('LFC Nike Mens 24/25 Home Match Jersey'));
    await tester.pumpAndSettle();

    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('Check price format is correct on the detail screen', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.text('LFC Nike Mens 24/25 Home Match Jersey'));
    await tester.pumpAndSettle();

    expect(find.text('Price: \$89.99'), findsOneWidget);
  });
}
