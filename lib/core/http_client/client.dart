import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../util/constant.dart';
import '../util/logger.dart';
import 'exception.dart';

class BaseApiClient {
  static const int timeOutDuration = 20;

  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? queryParams,
  }) async {
    final uri = Uri.parse(Constant.baseUrl + Constant.version + endPoint)
        .replace(queryParameters: queryParams);
    try {
      log('\x1B[92m(get) requesting URL: $uri');
      final response = await http
          .get(uri, headers: await _setHeader())
          .timeout(const Duration(seconds: timeOutDuration));
      log('\x1B[95mResponse status code: ${response.statusCode}');
      return _processResponse(response);
    } catch (e) {
      return _handleException(e, uri.toString());
    }
  }

  Future<dynamic> post({required String endPoint, dynamic data}) async {
    final uri = Uri.parse(Constant.baseUrl + Constant.version + endPoint);

    try {
      log('\x1B[92m(post) requesting URL: $uri');
      logger(data);

      final response = await http
          .post(
            uri,
            body: jsonEncode(data),
            headers: await _setHeader(),
          )
          .timeout(const Duration(seconds: timeOutDuration));
      logger('error');

      // ignore: prefer_adjacent_string_concatenation
      logger("\x1B[92m(post) requesting URL: $uri\n\x1B[95mResponse status code: ${response.statusCode.toString()}\n${jsonEncode(data)}\n");
      return _processResponse(response);
    } catch (e) {
      throw _handleException(e, uri.toString());
    }
  }

Future<dynamic> postMultipart({
  required String endPoint,
  required Map<String, String> fields,
  required List<File> imageFiles,
  String imageKey = 'image',
}) async {
  final uri = Uri.parse(Constant.baseUrl + Constant.version + endPoint);

  try {
    log('\x1B[94m(multipart POST) requesting URL: $uri');
    final request = http.MultipartRequest('POST', uri);

    // Set headers (excluding content-type, it’s set automatically)
    final headers = await _setHeader();
    request.headers.addAll(headers);
// Log fields
    log('\x1B[94mMultipart fields:');
    fields.forEach((key, value) {
      log('  $key: $value');
    });
    // Add fields
    request.fields.addAll(fields);

    // Add image file
    // ✅ Add multiple image files
    for (File file in imageFiles) {
      log('Adding file: ${file.path} (${await file.length()} bytes)');
      request.files.add(
        await http.MultipartFile.fromPath(imageKey, file.path),
      );
    }

    // Send request
    final streamedResponse = await request.send().timeout(
          const Duration(seconds: timeOutDuration),
        );
    final response = await http.Response.fromStream(streamedResponse);

    log("\x1B[94m(multipart POST) response status: ${response.statusCode}");
    return _processResponse(response);
  } catch (e) {
    log("\x1B[91m(multipart POST) error: $e");
    throw _handleException(e, uri.toString());
  }
}


  Future<dynamic> put({required String endPoint, dynamic data}) async {
    final uri = Uri.parse(Constant.baseUrl + Constant.version + endPoint);
    try {
      log('\x1B[92m(put) requesting URL: $uri');
      final response = await http
          .put(
            uri,
            body: jsonEncode(data),
            headers: await _setHeader(),
          )
          .timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } catch (e) {
      throw _handleException(e, uri.toString());
    }
  }

  Future<dynamic> delete({required String endPoint, dynamic data}) async {
    final uri = Uri.parse(Constant.baseUrl + Constant.version + endPoint);
    final dataJson = json.encode(data);

    try {
      log('\x1B[92m(post) requesting URL: $uri');
      log(jsonEncode(data));
      final response = await http
          .delete(
            uri,
            body: dataJson,
            headers: await _setHeader(),
          )
          .timeout(const Duration(seconds: timeOutDuration));

      log('\x1B[95mResponse status code: ${response.statusCode}');
      return _processResponse(response);
    } catch (e) {
      throw _handleException(e, uri.toString());
    }
  }

  Future<Map<String, String>> _setHeader() async {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-api-key': 'reqres-free-v1'
      };
  }

  dynamic _processResponse(http.Response response) {
    log("Response Body->\n${response.body}");
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 202:
        return json.decode(response.body);
      case 204:
        return null;
      case 201:
        return json.decode(response.body);
      case 400:
        final decoded = json.decode(response.body);
        throw BadRequestException(decoded['message'] ?? 'Bad Request');
      case 403:
        final decoded = json.decode(response.body);
        throw UnAuthorizedException(
          decoded['message'] ?? 'Unauthorized',
        );
      case 404:
        final decoded = json.decode(response.body);
        throw NotFoundException(
          decoded['message'] ?? 'Not Found',
        );
      case 401:
        final decoded = json.decode(response.body);
        throw AuthException(
          decoded['message'] ?? 'Unauthorized',
        );
      case 408:
        final decoded = json.decode(response.body);
        throw ApiNotRespondingException(
          decoded['message'] ?? 'API not responding',
        );
      case 409:
        final decoded = json.decode(response.body);
        throw ConflictException(
          decoded['message'] ?? 'Conflict',
        );
      case 410:
        final decoded = json.decode(response.body);
        throw GoneException(
          decoded['message'] ?? 'Gone',
        );
      case 412:
        final decoded = json.decode(response.body);
        throw PreconditionFailedException(
          decoded['message'] ?? 'Precondition Failed',
        );
      case 415:
        final decoded = json.decode(response.body);
        throw UnsupportedMediaTypeException(
          decoded['message'] ?? 'Unsupported Media Type',
        );
      case 429:
        final decoded = json.decode(response.body);
        throw TooManyRequestsException(
          decoded['message'] ?? 'Too Many Requests',
        );
      case 422:
        final decoded = json.decode(response.body);
        throw UnProcessableEntityException(
          decoded['message'] ?? 'Unprocessable Entity',
        );
      case 500:
        final decoded = json.decode(response.body);
        throw ServerException(
          message: decoded['message'] ?? 'Internal Server Error',
          statusCode: response.statusCode,
        );
      case 502:
        final decoded = json.decode(response.body);
        throw BadGatewayException(
          decoded['message'] ?? 'Bad Gateway',
        );
      case 503:
        final decoded = json.decode(response.body);
        throw ServiceUnavailableException(
          decoded['message'] ?? 'Service Unavailable',
        );
      case 504:
        final decoded = json.decode(response.body);
        throw GatewayTimeoutException(
          decoded['message'] ?? 'Gateway Timeout',
        );
      default:
        final decoded = json.decode(response.body);
        throw FetchDataException(
          decoded['message'] ?? 'Error occurred',
        );
    }
  }

  Exception _handleException(dynamic error, String url) {
    if (error is SocketException) {
      throw FetchDataException('No Internet connection');
    } else if (error is TimeoutException) {
      throw ApiNotRespondingException('API not responded in time');
    } else {
      print(error);
      throw error;
    }
  }
}


/*import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../util/constant.dart';
import 'exception.dart';

class BaseApiClient {
  static const int timeOutDuration = 20;
  final Dio _dio = Dio();
  final _storage = const FlutterSecureStorage();

  BaseApiClient() {
    _dio.options
      ..baseUrl = Constant.baseUrl + Constant.version
      ..connectTimeout = const Duration(seconds: timeOutDuration)
      ..receiveTimeout = const Duration(seconds: timeOutDuration)
      ..responseType = ResponseType.json;

    // ✅ Attach interceptors
    _dio.interceptors.addAll([
      _loggingInterceptor(),
      _tokenInterceptor(),
    ]);
  }

  // ============================ HEADERS ============================
  Future<Map<String, String>> _setHeader() async {
    final token = await _storage.read(key: Constant.token);
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  // ============================ GET ============================
  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final headers = await _setHeader();
      final response = await _dio.get(
        endPoint,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
      return _processResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // ============================ POST ============================
  Future<dynamic> post({
    required String endPoint,
    dynamic data,
  }) async {
    try {
      final headers = await _setHeader();
      final response = await _dio.post(
        endPoint,
        data: jsonEncode(data),
        options: Options(headers: headers),
      );
      return _processResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // ============================ MULTIPART ============================
  Future<dynamic> postMultipart({
    required String endPoint,
    required Map<String, String> fields,
    required List<File> imageFiles,
    String imageKey = 'image',
  }) async {
    try {
      final headers = await _setHeader();

      final formData = FormData.fromMap({
        ...fields,
        imageKey: [
          for (var file in imageFiles)
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
            ),
        ],
      });

      final response = await _dio.post(
        endPoint,
        data: formData,
        options: Options(headers: {
          ...headers,
          'Content-Type': 'multipart/form-data',
        }),
      );

      return _processResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // ============================ PUT ============================
  Future<dynamic> put({
    required String endPoint,
    dynamic data,
  }) async {
    try {
      final headers = await _setHeader();
      final response = await _dio.put(
        endPoint,
        data: jsonEncode(data),
        options: Options(headers: headers),
      );
      return _processResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // ============================ DELETE ============================
  Future<dynamic> delete({
    required String endPoint,
    dynamic data,
  }) async {
    try {
      final headers = await _setHeader();
      final response = await _dio.delete(
        endPoint,
        data: jsonEncode(data),
        options: Options(headers: headers),
      );
      return _processResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // ============================ RESPONSE HANDLING ============================
  dynamic _processResponse(Response response) {
    final statusCode = response.statusCode ?? 0;
    final data = response.data is String ? jsonDecode(response.data) : response.data;

    switch (statusCode) {
      case 200:
      case 201:
      case 202:
      case 204:
        return data;
      case 400:
        throw BadRequestException(data['message'] ?? 'Bad Request');
      case 401:
        throw AuthException(data['message'] ?? 'Unauthorized');
      case 403:
        throw UnAuthorizedException(data['message'] ?? 'Forbidden');
      case 404:
        throw NotFoundException(data['message'] ?? 'Not Found');
      case 409:
        throw ConflictException(data['message'] ?? 'Conflict');
      case 422:
        throw UnProcessableEntityException(data['message'] ?? 'Unprocessable Entity');
      case 500:
        throw ServerException(
          message: data['message'] ?? 'Internal Server Error',
          statusCode: statusCode,
        );
      default:
        throw FetchDataException(data['message'] ?? 'Unexpected error occurred');
    }
  }

  // ============================ ERROR HANDLING ============================
  Exception _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return ApiNotRespondingException('API not responding in time');
    } else if (e.type == DioExceptionType.badResponse && e.response != null) {
      return _processResponse(e.response!);
    } else if (e.type == DioExceptionType.unknown && e.error is SocketException) {
      return FetchDataException('No Internet connection');
    }
    return FetchDataException(e.message ?? 'Unexpected network error');
  }

  // ============================ INTERCEPTORS ============================
  Interceptor _loggingInterceptor() {
    return LogInterceptor(
      requestHeader: false,
      responseHeader: false,
      requestBody: true,
      responseBody: true,
      logPrint: (obj) => print('\x1B[94m$obj\x1B[0m'),
    );
  }

  Interceptor _tokenInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        // You could dynamically inject headers here if needed
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          print('⚠️ Token expired, refreshing...');

          final refreshed = await _refreshToken();
          if (refreshed) {
            // Retry request with new token
            final newToken = await _storage.read(key: Constant.token);
            e.requestOptions.headers['Authorization'] = 'Bearer $newToken';

            final cloneReq = await _dio.fetch(e.requestOptions);
            return handler.resolve(cloneReq);
          }
        }
        return handler.next(e);
      },
    );
  }

  // ============================ TOKEN REFRESH ============================
  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await _storage.read(key: Constant.token*//* it will be refresh token*//*);
      if (refreshToken == null) return false;

      final response = await _dio.post(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200) {
        final newToken = response.data['token'];
        await _storage.write(key: Constant.token, value: newToken);
        print('✅ Token refreshed successfully.');
        return true;
      }
    } catch (e) {
      print('❌ Token refresh failed: $e');
    }
    return false;
  }
}*/
