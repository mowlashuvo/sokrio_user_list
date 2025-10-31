import 'dart:io';
import 'package:sokrio_user_list/core/http_client/exception.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sokrio_user_list/core/http_client/client.dart';
import 'package:sokrio_user_list/features/user/data/datasources/user_remote_datasource.dart';
import 'package:sokrio_user_list/features/user/data/models/user_model.dart';

class MockBaseApiClient extends Mock implements BaseApiClient {}

void main() {
  late MockBaseApiClient mockClient;
  late UserRemoteDataSourceImpl datasource;

  setUp(() {
    mockClient = MockBaseApiClient();
    datasource = UserRemoteDataSourceImpl(client: mockClient);
  });

  group('UserRemoteDataSourceImpl', () {
    final rawJson = {
      "page": 1,
      "per_page": 6,
      "total": 12,
      "total_pages": 2,
      "data": [
        {
          "id": 1,
          "email": "test@example.com",
          "first_name": "John",
          "last_name": "Doe",
          "avatar": "https://example.com/avatar.png",
        },
      ],
      "support": {"url": "https://example.com", "text": "support text"},
    };

    test('parses UserModel when client returns valid json', () async {
      when(
        () => mockClient.get(endPoint: any(named: 'endPoint')),
      ).thenAnswer((_) async => rawJson);

      final result = await datasource.getUser(page: 1, limit: 6);

      expect(result, isA<UserModel>());
      expect(result.page, 1);
      expect(result.data, isNotNull);
      expect(result.data!.first.email, 'test@example.com');
      verify(
        () => mockClient.get(endPoint: '/users?per_page=6&page=1'),
      ).called(1);
    });

    test(
      'throws NoInternetException when client throws SocketException',
      () async {
        when(
          () => mockClient.get(endPoint: any(named: 'endPoint')),
        ).thenThrow(const SocketException('Network is unreachable'));

        expect(
          () => datasource.getUser(page: 1, limit: 6),
          throwsA(isA<NoInternetException>()),
        );
        verify(
          () => mockClient.get(endPoint: '/users?per_page=6&page=1'),
        ).called(1);
      },
    );

    test(
      'throws ServerException when client throws generic exception',
      () async {
        when(
          () => mockClient.get(endPoint: any(named: 'endPoint')),
        ).thenThrow(Exception('boom'));

        expect(
          () => datasource.getUser(page: 1, limit: 6),
          throwsA(isA<ServerException>()),
        );
        verify(
          () => mockClient.get(endPoint: '/users?per_page=6&page=1'),
        ).called(1);
      },
    );
  });
}
