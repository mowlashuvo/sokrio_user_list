import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'dart:io';
import 'package:sokrio_user_list/core/http_client/exception.dart';
import 'package:sokrio_user_list/core/http_client/failure.dart';
import 'package:sokrio_user_list/features/user/data/datasources/user_remote_datasource.dart';
import 'package:sokrio_user_list/features/user/data/models/user_model.dart';
import 'package:sokrio_user_list/features/user/data/repositories/user_repository_impl.dart';
import 'package:sokrio_user_list/features/user/domain/entities/user_entity.dart';
import 'package:sokrio_user_list/features/user/domain/repositories/user_repository.dart';
import 'package:sokrio_user_list/features/user/domain/usecases/user_usecase.dart';

class MockUserRemoteDataSource extends Mock implements UserRemoteDataSource {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRemoteDataSource mockRemote;
  late UserRepositoryImpl repository;

  setUp(() {
    mockRemote = MockUserRemoteDataSource();
    repository = UserRepositoryImpl(remoteDataSource: mockRemote);
  });

  group('UserRepositoryImpl', () {
    final tUserModel = UserModel(
      page: 1,
      perPage: 6,
      total: 12,
      totalPages: 2,
      data: [
        UserDataModel(
          id: 1,
          email: 'test@example.com',
          firstName: 'John',
          lastName: 'Doe',
          avatar: 'https://example.com/avatar.png',
        ),
      ],
      support: SupportModel(url: 'https://example.com', text: 'support text'),
    );

    test(
      'returns Right(UserEntity) when remote datasource returns data',
      () async {
        when(
          () => mockRemote.getUser(page: 1, limit: 6),
        ).thenAnswer((_) async => tUserModel);

        final result = await repository.getUser(page: 1, limit: 6);

        expect(result.isRight(), true);
        result.fold((l) => fail('Expected Right, got Left: $l'), (r) {
          expect(r.page, tUserModel.page);
          expect(r.data.length, 1);
          expect(r.data.first.email, tUserModel.data!.first.email);
        });
        verify(() => mockRemote.getUser(page: 1, limit: 6)).called(1);
      },
    );

    test('returns ServerFailure when remote throws ServerException', () async {
      when(() => mockRemote.getUser(page: 1, limit: 6)).thenThrow(
        const ServerException(message: 'Server error', statusCode: 500),
      );

      final result = await repository.getUser(page: 1, limit: 6);

      expect(result.isLeft(), true);
      result.fold((l) {
        expect(l, isA<ServerFailure>());
        expect((l as ServerFailure).message, contains('Server error'));
      }, (r) => fail('Expected Left, got Right: $r'));
      verify(() => mockRemote.getUser(page: 1, limit: 6)).called(1);
    });

    test(
      'returns ConnectionFailure when remote throws NoInternetException',
      () async {
        when(
          () => mockRemote.getUser(page: 1, limit: 6),
        ).thenThrow(const NoInternetException('No Internet Connection'));

        final result = await repository.getUser(page: 1, limit: 6);

        expect(result.isLeft(), true);
        result.fold((l) {
          expect(l, isA<ConnectionFailure>());
          expect((l as ConnectionFailure).message, contains('No Internet'));
        }, (r) => fail('Expected Left, got Right: $r'));
        verify(() => mockRemote.getUser(page: 1, limit: 6)).called(1);
      },
    );

    test(
      'returns ConnectionFailure when remote throws SocketException',
      () async {
        when(
          () => mockRemote.getUser(page: 1, limit: 6),
        ).thenThrow(const SocketException('Network is unreachable'));

        final result = await repository.getUser(page: 1, limit: 6);

        expect(result.isLeft(), true);
        result.fold((l) {
          expect(l, isA<ConnectionFailure>());
          expect(
            (l as ConnectionFailure).message,
            contains('Network is unreachable'),
          );
        }, (r) => fail('Expected Left, got Right: $r'));
        verify(() => mockRemote.getUser(page: 1, limit: 6)).called(1);
      },
    );

    test('returns AuthFailure when remote throws AuthException', () async {
      when(
        () => mockRemote.getUser(page: 1, limit: 6),
      ).thenThrow(const AuthException('Auth failed'));

      final result = await repository.getUser(page: 1, limit: 6);

      expect(result.isLeft(), true);
      result.fold((l) {
        expect(l, isA<AuthFailure>());
      }, (r) => fail('Expected Left, got Right: $r'));
      verify(() => mockRemote.getUser(page: 1, limit: 6)).called(1);
    });

    test(
      'returns ServerFailure when remote throws generic Exception',
      () async {
        when(
          () => mockRemote.getUser(page: 1, limit: 6),
        ).thenThrow(Exception('boom'));

        final result = await repository.getUser(page: 1, limit: 6);

        expect(result.isLeft(), true);
        result.fold((l) {
          expect(l, isA<ServerFailure>());
          expect((l as ServerFailure).statusCode, 500);
          expect(l.message, contains('Exception: boom'));
        }, (r) => fail('Expected Left, got Right: $r'));
        verify(() => mockRemote.getUser(page: 1, limit: 6)).called(1);
      },
    );
  });

  group('UserUseCase', () {
    late MockUserRepository mockRepository;
    late UserUseCase useCase;

    setUp(() {
      mockRepository = MockUserRepository();
      useCase = UserUseCase(repository: mockRepository);
    });

    test('forwards call to repository and returns UserEntity', () async {
      final entity = UserEntity(
        page: 1,
        perPage: 6,
        total: 12,
        totalPages: 2,
        data: [
          const UserDataEntity(
            id: 1,
            email: 'test@example.com',
            firstName: 'John',
            lastName: 'Doe',
            avatar: 'a',
          ),
        ],
        support: const SupportEntity(url: 'u', text: 't'),
      );

      when(
        () => mockRepository.getUser(page: 1, limit: 6),
      ).thenAnswer((_) async => Right(entity));

      final result = await useCase.getUser(page: 1, limit: 6);

      expect(result.isRight(), true);
      result.fold((l) => fail('Expected Right, got Left: $l'), (r) {
        expect(r.page, 1);
        expect(r.data.length, 1);
      });
      verify(() => mockRepository.getUser(page: 1, limit: 6)).called(1);
    });
  });
}
