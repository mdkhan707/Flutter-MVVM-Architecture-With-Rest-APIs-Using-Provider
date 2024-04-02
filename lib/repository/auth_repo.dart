import 'package:mvvm_architecture/data/network/baseapisevice.dart';
import 'package:mvvm_architecture/data/network/networkapiservice.dart';
import 'package:mvvm_architecture/resources/app_url.dart';

class AuthRepo {
  BaseApiServise apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.loginurl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> RegisterApi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.registerurl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
