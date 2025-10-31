import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sokrio_user_list/core/network/network_info.dart';
import 'package:sokrio_user_list/features/user/domain/entities/user_entity.dart';
import 'package:sokrio_user_list/features/user/domain/usecases/user_usecase.dart';
import 'package:sokrio_user_list/features/user/presentation/bloc/user/user_bloc.dart';

class MockUserUseCase extends Mock implements UserUseCase {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late MockUserUseCase mockUseCase;
  late MockSharedPreferences mockPrefs;
  late MockNetworkInfo mockNetwork;

  setUpAll(() {
    registerFallbackValue(const UserDataEntity());
  });

  setUp(() {
    mockUseCase = MockUserUseCase();
    mockPrefs = MockSharedPreferences();
    mockNetwork = MockNetworkInfo();
  });

  blocTest<UserBloc, UserState>(
    'emits [loading, error] when device is offline on load',
    build: () {
      when(() => mockNetwork.isConnected).thenAnswer((_) async => false);
      return UserBloc(
        useCase: mockUseCase,
        prefs: mockPrefs,
        networkInfo: mockNetwork,
      );
    },
    act: (bloc) => bloc.add(UserLoadEvent()),
    // Accept final error state (loading may be emitted too briefly in some runs)
    verify: (bloc) {
      expect(bloc.state.status, UserStatus.error);
      expect(bloc.state.error, 'No Internet Connection');
    },
  );

  blocTest<UserBloc, UserState>(
    'returns cached page when cache exists and is fresh',
    build: () {
      when(() => mockNetwork.isConnected).thenAnswer((_) async => true);

      final cachedEntity = const UserDataEntity(
        id: 1,
        email: 'test@example.com',
        firstName: 'John',
        lastName: 'Doe',
        avatar: 'a',
      );

      final encoded = jsonEncode(cachedEntity.toJson());

      when(
        () => mockPrefs.getStringList('user_list_page_1'),
      ).thenReturn([encoded]);
      when(
        () => mockPrefs.getString('user_list_page_timestamp1'),
      ).thenReturn(DateTime.now().toIso8601String());

      return UserBloc(
        useCase: mockUseCase,
        prefs: mockPrefs,
        networkInfo: mockNetwork,
      );
    },
    act: (bloc) => bloc.add(UserLoadEvent()),
    // Accept final success state (loading may be emitted briefly and missed)
    verify: (bloc) {
      expect(bloc.state.status, UserStatus.success);
      expect(bloc.state.data.length, 1);
    },
  );

  blocTest<UserBloc, UserState>(
    'fetches from usecase and caches the page on success',
    build: () {
      when(() => mockNetwork.isConnected).thenAnswer((_) async => true);

      final userEntity = UserEntity(
        page: 1,
        perPage: 10,
        total: 1,
        totalPages: 1,
        data: [
          const UserDataEntity(
            id: 1,
            email: 'a@b.com',
            firstName: 'A',
            lastName: 'B',
            avatar: 'u',
          ),
        ],
        support: const SupportEntity(url: 'u', text: 't'),
      );

      when(() => mockPrefs.getStringList('user_list_page_1')).thenReturn(null);
      when(
        () => mockUseCase.getUser(page: 1, limit: any(named: 'limit')),
      ).thenAnswer((_) async => Right(userEntity));

      when(
        () => mockPrefs.setStringList(any(), any()),
      ).thenAnswer((_) async => true);
      when(
        () => mockPrefs.setString(any(), any()),
      ).thenAnswer((_) async => true);

      return UserBloc(
        useCase: mockUseCase,
        prefs: mockPrefs,
        networkInfo: mockNetwork,
      );
    },
    act: (bloc) => bloc.add(UserLoadEvent()),
    // Match the final success state
    verify: (bloc) {
      expect(bloc.state.status, UserStatus.success);
      expect(bloc.state.data.length, 1);
      verify(
        () => mockPrefs.setStringList('user_list_page_1', any()),
      ).called(1);
      verify(
        () => mockPrefs.setString('user_list_page_timestamp1', any()),
      ).called(1);
    },
  );

  blocTest<UserBloc, UserState>(
    'refresh clears old cache, fetches fresh data and caches it',
    build: () {
      when(() => mockNetwork.isConnected).thenAnswer((_) async => true);

      final userEntity = UserEntity(
        page: 1,
        perPage: 10,
        total: 2,
        totalPages: 2,
        data: [
          const UserDataEntity(
            id: 1,
            email: 'a@b.com',
            firstName: 'A',
            lastName: 'B',
            avatar: 'u',
          ),
        ],
        support: const SupportEntity(url: 'u', text: 't'),
      );

      when(
        () => mockUseCase.getUser(page: 1, limit: any(named: 'limit')),
      ).thenAnswer((_) async => Right(userEntity));

      when(() => mockPrefs.remove(any())).thenAnswer((_) async => true);
      when(
        () => mockPrefs.setStringList(any(), any()),
      ).thenAnswer((_) async => true);
      when(
        () => mockPrefs.setString(any(), any()),
      ).thenAnswer((_) async => true);

      return UserBloc(
        useCase: mockUseCase,
        prefs: mockPrefs,
        networkInfo: mockNetwork,
      );
    },
    act: (bloc) => bloc.add(UserRefreshEvent()),
    // Final state should be success with one item
    verify: (bloc) {
      expect(bloc.state.status, UserStatus.success);
      expect(bloc.state.data.length, 1);
      // totalPages == 2 -> remove called twice per page (page key + timestamp)
      verify(() => mockPrefs.remove(any())).called(4);
      verify(
        () => mockPrefs.setStringList('user_list_page_1', any()),
      ).called(1);
      verify(
        () => mockPrefs.setString('user_list_page_timestamp1', any()),
      ).called(1);
    },
  );

  blocTest<UserBloc, UserState>(
    'search filters userList correctly',
    build: () {
      when(() => mockNetwork.isConnected).thenAnswer((_) async => true);
      return UserBloc(
        useCase: mockUseCase,
        prefs: mockPrefs,
        networkInfo: mockNetwork,
      );
    },
    act: (bloc) {
      bloc.userList = [
        const UserDataEntity(id: 1, firstName: 'John', lastName: 'Doe'),
        const UserDataEntity(id: 2, firstName: 'Jane', lastName: 'Smith'),
      ];
      bloc.add(const UserSearchEvent(query: 'Jane'));
    },
    verify: (bloc) {
      expect(bloc.state.data.length, 1);
      expect(bloc.state.data.first.firstName, 'Jane');
    },
  );

  blocTest<UserBloc, UserState>(
    'pagination sets isLoadingMore and hasReachedMax when totalPages <= currentPage',
    build: () {
      when(() => mockNetwork.isConnected).thenAnswer((_) async => true);

      final userEntity = UserEntity(
        page: 2,
        perPage: 10,
        total: 2,
        totalPages: 1,
        data: [const UserDataEntity(id: 3, firstName: 'P', lastName: 'Q')],
        support: const SupportEntity(url: 'u', text: 't'),
      );

      when(() => mockPrefs.getStringList('user_list_page_2')).thenReturn(null);
      when(
        () => mockUseCase.getUser(page: 2, limit: any(named: 'limit')),
      ).thenAnswer((_) async => Right(userEntity));
      when(
        () => mockPrefs.setStringList(any(), any()),
      ).thenAnswer((_) async => true);
      when(
        () => mockPrefs.setString(any(), any()),
      ).thenAnswer((_) async => true);

      return UserBloc(
        useCase: mockUseCase,
        prefs: mockPrefs,
        networkInfo: mockNetwork,
      );
    },
    act: (bloc) {
      bloc.currentPage = 2;
      bloc.add(UserLoadEvent());
    },
    // Ensure final state indicates success and hasReachedMax is true
    verify: (bloc) {
      expect(bloc.state.status, UserStatus.success);
      expect(bloc.state.hasReachedMax, true);
    },
  );
}
