import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_app/blocs/my_bloc.dart';
import 'package:my_flutter_app/main.dart';

class MockMyBloc extends MockBloc<MyEvent, MyState> implements MyBloc {}

void main() {
  group("MyWidget", () {
    late MyBloc mockMyBloc;

    setUp(() {
      mockMyBloc = MockMyBloc();
    });

    testWidgets("displays Scaffold", (tester) async {
      whenListen(
        mockMyBloc,
        Stream.fromIterable([
          const MyState.initial(),
          const MyState.loaded(),
        ]),
        // initialState: const MyState.initial(),
      );

      await tester.pumpWidget(BlocProvider.value(
        value: mockMyBloc,
        child: const MaterialApp(
          home: Scaffold(
            body: MyHomePage(
              title: 'yo',
            ),
          ),
        ),
      ));

      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
