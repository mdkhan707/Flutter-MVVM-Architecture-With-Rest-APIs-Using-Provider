import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mvvm_architecture/data/app_exception.dart';
import 'package:mvvm_architecture/data/network/baseapisevice.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServise {
  @override
  Future getGetApiResponse(String url) async {
    dynamic ResponseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      ResponseJson = ReturnResponse(response);
    } on Socket {
      throw FetchDataException('No internet connection');
    }
    return ResponseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic ResponseJson;
    try {
      Response response = await post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      ResponseJson = ReturnResponse(response);
    } on Socket {
      throw FetchDataException('No internet connection');
    }
    return ResponseJson;
  }

  dynamic ReturnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnautorisedException(response.body.toString());
      default:
        throw FetchDataException('Error occured durin communication ' +
            "with status code" +
            response.statusCode.toString());
    }
  }
}
