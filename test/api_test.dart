import 'package:dio/dio.dart';
import 'package:final_year_project_mobile_app/logic/repository/api_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

const successMessage = {'message': 'Success'};
const errorMessage = {'message': 'error'};
const testPath = 'test';
const testData = {'data': 'sample data'};
const header = {'Content-Type': 'application/json'};
const loginSuccessResponse = {
  'tokens': {
    'access': 'access token',
    'refresh': 'refresh token',
  },
  'user': {
    'dob': '2020-01-01',
    'gender': 'MALE',
    'other_name': null,
    'first_name': 'test',
    'last_name': 'test',
    'email': 'f1@gmail.com',
  }
};

const userDetails = {
  'dob': '2020-01-01',
  'gender': 'MALE',
  'other_name': null,
  'first_name': 'test',
  'last_name': 'test',
  'email': 'f@gmail.com',
  'password': '1233456'
};

const wrongDetails = {
  'dob': '2020-01-01',
  'gender': 'MALE',
  'other_name': null,
  'first_name': 'test',
  'last_name': 'test',
  'email': '32424324324234dfsfsf',
  'password': '1233456'
};

void main() {
  final dio = Dio();
  late DioError dioErrorForLogin;
  late DioError dioErrorForSignup;
  final String baseUrl =
      'https://prediction-disease-test.herokuapp.com/api/v1/';
  final DioAdapter dioAdapter = DioAdapter(dio: dio);

  setUpAll(() {
    dio.httpClientAdapter = dioAdapter;
    dioErrorForLogin = DioError(
        response: Response(
            statusCode: 400,
            requestOptions: RequestOptions(path: baseUrl + 'auth/login')),
        requestOptions: RequestOptions(path: baseUrl + 'auth/login'),
        error: {
          'error': {
            'error': {'message': 'Invalid credentials'}
          }
        },
        type: DioErrorType.response);
  });

  dioErrorForSignup = DioError(
      response: Response(
          statusCode: 400,
          requestOptions: RequestOptions(path: baseUrl + 'auth/signup')),
      requestOptions: RequestOptions(path: baseUrl + 'auth/signup'),
      error: {
        'error': {
          'error': {'message': 'Invalid credentials'}
        }
      },
      type: DioErrorType.response);

  group('- Api Repository Class Test', () {
    group('- Auth Methods', () {
      group(' - Login', () {
        test('- Login Method with invalid credentials', () async {
          dioAdapter.onPost(
            baseUrl + 'auth/login',
            (request) {
              return request.throws(400, dioErrorForLogin);
            },
            data: Matchers.any,
            headers: header,
          );

          final repo = ApiRepository(dio: dio);
          expect(() async => await repo.login('someone@gmail.com', '123456'),
              throwsA(isA<DioError>()));
        });

        test('- Login with valid credentials', () async {
          dioAdapter.onPost(baseUrl + 'auth/login', (server) {
            return server.reply(202, loginSuccessResponse);
          },
              data: {'email': 'f1@gmail.com', 'password': '123456'},
              headers: header);
          final repo = ApiRepository(dio: dio);
          expect(() async => await repo.login('f1@gmail.com', '123456'),
              returnsNormally);
        });
      });

      group('- SignUp', () {
        test('- SignUp with invalid credentials', () async {
          dioAdapter.onPost(
            baseUrl + 'auth/signup',
            (request) {
              return request.throws(400, dioErrorForSignup);
            },
            data: wrongDetails,
            headers: header,
          );
          final repo = ApiRepository(dio: dio);
          expect(
            () async => await repo.signUp(wrongDetails),
            throwsA(isA<DioError>()),
          );
        });
        test('- SignUp with valid credentials', () {
          dioAdapter.onPost(
            baseUrl + 'auth/signup',
            (request) {
              return request.reply(201, {
                'message': 'user created',
                'user': {'email': 'f@gmail.com'}
              });
            },
            data: userDetails,
            headers: header,
          );
          final repo = ApiRepository(dio: dio);
          expect(() async => await repo.signUp(userDetails), returnsNormally);
        });
      });
    });
  });
}
