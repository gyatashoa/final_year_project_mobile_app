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

  Future signUp(Map<String, dynamic> data) async {
    var response;
    try {
      var signUpUrl = '${baseUrl}auth/signup';
      var res = await dio.post(signUpUrl, data: data);
      response = returnResponse(res);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return response;
  }

  Future getSymptoms() async {
    var response;
    try {
      var symptomsUrl = '${baseUrl}predictions/symptoms';
      var res = await dio.get(symptomsUrl);
      response = returnResponse(res);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return response;
  }

  Future predict(List<String> symptoms, String accessToken) async {
    var response;
    try {
      var predictionUrl = baseUrl + 'predictions/predict';
      var res = await dio.request(predictionUrl,
          data: {'symptoms': symptoms},
          options: Options(
            headers: {'Authorization': 'Bearer ' + accessToken},
          ));
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return response;
  }

  Future refreshMyToken(String refreshToken) async {
    var response;
    try {
      var baseRefreshTokenUrl = baseUrl + 'auth/refresh';
      var res = await dio.get(baseRefreshTokenUrl,
          options:
              Options(headers: {'Authorization': 'Bearer ' + refreshToken}));
      response = returnResponse(res);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return response;
  }

  //TODO: implement on server first
  // Future getMyPredtictions(String accessToken) async {

  //   // var response;
  //   // try {} on SocketException {
  //   //   throw FetchDataException('No Internet Connection');
  //   // }
  //   // return response;
  // }

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
