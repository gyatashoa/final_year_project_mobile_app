import 'dart:io';

import 'package:dio/dio.dart';
import 'package:final_year_project_mobile_app/exceptions/exceptions.dart';
import 'package:final_year_project_mobile_app/models/user.dart';

class ApiRepository {
  final Dio dio;
  final String baseUrl =
      'https://prediction-disease-test.herokuapp.com/api/v1/';
  ApiRepository({required this.dio});

  Future login(String email, String password) async {
    var response;
    try {
      var loginUrl = '${baseUrl}auth/login';
      var res = await dio.post(loginUrl, data: {
        'email': email,
        'password': password,
      });
      response = returnResponse(res);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return response;
  }

  Future signUp(User user) async {}

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        return response.data;
      case 400:
        throw BadRequestException(response.data['error']['message']);
      case 401:
      case 403:
        throw UnauthorisedException(response.data['error']['message']);
      case 404:
        throw FetchDataException(response.data['error']['message']);
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server StatusCode:${response.statusCode}');
    }
  }
}
