import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sokrio_user_list/features/user/presentation/widget/user_view.dart';
import 'package:sokrio_user_list/features/user/domain/entities/user_entity.dart';

void main() {
  testWidgets('UserTile displays name and email and reacts to tap', (
    tester,
  ) async {
    final user = const UserDataEntity(
      id: 1,
      firstName: 'Alice',
      lastName: 'Wonder',
      email: 'alice@example.com',
    );

    var tapped = false;

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, __) => MaterialApp(
          home: Scaffold(
            body: UserTile(user: user, onTap: () => tapped = true),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Alice Wonder'), findsOneWidget);
    expect(find.text('alice@example.com'), findsOneWidget);

    await tester.tap(find.byType(UserTile));
    await tester.pumpAndSettle();

    expect(tapped, isTrue);
  });
}
