import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_shopping/screens/home/home.dart';

void main() {
  testWidgets(
    "[HomeScreen] test if one Consumer widget exists",
    (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: HomeScreen())));
      final appType = find.byType(Consumer);
      expect(appType, findsOneWidget);
    },
  );
}
