import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture/models/user_model.dart';
import 'package:mvvm_architecture/repository/auth_repo.dart';
import 'package:mvvm_architecture/utils/Routes/routesname.dart';
import 'package:mvvm_architecture/utils/Routes/utils.dart';
import 'package:mvvm_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  final _Repo = AuthRepo();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _Repo.loginApi(data).then((value) {
      setLoading(false);
      final userprefernce = Provider.of<UserViewModel>(context, listen: false);
      userprefernce.SaveUser(UserModel(
        token: value['token'].toString(),
      ));

      if (kDebugMode) {
        utils.flushbarmessage('Login successfully', context);
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      Navigator.pushNamed(context, RoutesName.home);
      setLoading(false);
      if (kDebugMode) {
        utils.flushbarmessage('Login successfully', context);
        print(error.toString());
      }
    });
  }

  Future<void> RegisterApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _Repo.RegisterApi(data)
        .then((value) => {
              setLoading(false),
              if (kDebugMode)
                {
                  utils.flushbarmessage('Signup successfully', context),
                  print(value.toString())
                }
            })
        .onError((error, stackTrace) => {
              Navigator.pushNamed(context, RoutesName.home),
              setLoading(false),
              if (kDebugMode)
                {
                  utils.flushbarmessage('Login successfully', context),
                  print(error.toString())
                }
            });
  }
}
