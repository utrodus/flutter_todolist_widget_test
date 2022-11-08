import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widget_test_tap_drag_enter_text/main.dart';
import 'package:flutter/material.dart';

createTodoListScreen() => const TodoList();

void main() {
  group('Test Add And Remove a Todo', () {
    testWidgets('test add a todo', (tester) async {
      /// Render todo list screen
      await tester.pumpWidget(createTodoListScreen());

      /// Enter 'hi' into the textfield
      await tester.enterText(find.byType(TextField), 'hi');

      /// Tap the add button
      await tester.tap(find.byType(FloatingActionButton));

      /// Rebuild the widget todo list screen
      await tester.pump();

      /// Verify that the todo list contains 'hi'
      expect(find.text('hi'), findsOneWidget);
    });

    testWidgets('test remove a todo', (tester) async {
      /// Render todo list screen
      await tester.pumpWidget(createTodoListScreen());

      /// Enter 'hi' into the textfield
      await tester.enterText(find.byType(TextField), 'hi');

      /// Tap the add button
      await tester.tap(find.byType(FloatingActionButton));

      /// Rebuild the widget todo list screen
      await tester.pump();

      /// Swipe the item to dismiss it / remove it.
      await tester.drag(find.byType(Dismissible), const Offset(500.0, 0.0));

      await tester.pumpAndSettle();

      /// Verify that the todo list not contains 'hi'
      expect(find.text('hi'), findsNothing);
    });
  });
}
