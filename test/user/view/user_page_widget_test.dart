import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokrio_user_list/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:sokrio_user_list/features/user/presentation/pages/user_page.dart';
import 'package:sokrio_user_list/features/user/presentation/widget/user_loading_shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sokrio_user_list/features/user/domain/entities/user_entity.dart';
import 'package:sokrio_user_list/features/user/presentation/widget/user_view.dart';
import 'package:sokrio_user_list/features/user/presentation/widget/user_error_state.dart';
import 'package:sokrio_user_list/features/user/presentation/widget/user_empty_state.dart';

// Create a MockUserBloc
class MockUserBloc extends Mock implements UserBloc {}

void main() {
  late MockUserBloc mockBloc;

  setUp(() {
    mockBloc = MockUserBloc();
  });

  testWidgets('shows loading shimmer when loading', (tester) async {
    // make bloc stream emit loading state
    whenListen(
      mockBloc,
      Stream.fromIterable([const UserState(status: UserStatus.loading)]),
      initialState: const UserState(),
    );
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, child) => MaterialApp(
          home: BlocProvider<UserBloc>.value(
            value: mockBloc,
            child: const UserPage(),
          ),
        ),
      ),
    );

    // allow widget tree to build
    await tester.pump();

    // assert loading widget is present (adjust Finder to actual widget/text)
    expect(find.byType(UserLoadingShimmer), findsOneWidget);
  });

  testWidgets('shows user list when success', (tester) async {
    final user = const UserDataEntity(
      id: 1,
      firstName: 'John',
      lastName: 'Doe',
      email: 'john@example.com',
    );

    whenListen(
      mockBloc,
      Stream.fromIterable([
        UserState(status: UserStatus.success, data: [user]),
      ]),
      initialState: const UserState(),
    );

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, child) => MaterialApp(
          home: BlocProvider<UserBloc>.value(
            value: mockBloc,
            child: const UserPage(),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(UserTile), findsOneWidget);
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('john@example.com'), findsOneWidget);
  });

  testWidgets('shows error state when error', (tester) async {
    whenListen(
      mockBloc,
      Stream.fromIterable([UserState(status: UserStatus.error, error: 'Oops')]),
      initialState: const UserState(),
    );

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, child) => MaterialApp(
          home: BlocProvider<UserBloc>.value(
            value: mockBloc,
            child: const UserPage(),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(UserErrorState), findsOneWidget);
    expect(find.text('Something went wrong'), findsOneWidget);
    // The error text may appear both in the error widget and as a SnackBar message.
    // Assert it appears inside the UserErrorState specifically to avoid duplicate matches.
    expect(
      find.descendant(
        of: find.byType(UserErrorState),
        matching: find.text('Oops'),
      ),
      findsOneWidget,
    );
  });

  testWidgets('shows empty state when no users', (tester) async {
    whenListen(
      mockBloc,
      Stream.fromIterable([UserState(status: UserStatus.success, data: [])]),
      initialState: const UserState(),
    );

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, child) => MaterialApp(
          home: BlocProvider<UserBloc>.value(
            value: mockBloc,
            child: const UserPage(),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(UserEmptyState), findsOneWidget);
    expect(find.text('No Users Found'), findsOneWidget);
  });
}
