import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture/models/user_model.dart';
import 'package:mvvm_architecture/utils/Routes/routesname.dart';
import 'package:mvvm_architecture/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getuserData() => UserViewModel().getUser();

  void CheckAuthentication(BuildContext context) async {
    getuserData().then((value) async {
      if (value.token == 'null' || value.token == '') {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
