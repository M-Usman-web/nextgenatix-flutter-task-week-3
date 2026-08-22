// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:nextgenatix_todo_app/main.dart';
import 'package:nextgenatix_todo_app/models/providers/todo_provider.dart';

void main() {
  testWidgets('Can add a task', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => TodoProvider(),
        child: const MyApp(),
      ),
    );

    expect(find.text('No tasks added yet. Tap + to add.'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    await tester.enterText(find.byType(TextField), 'Buy groceries');
    await tester.tap(find.text('Add'));
    await tester.pump();

    expect(find.text('Buy groceries'), findsOneWidget);
  });
}
