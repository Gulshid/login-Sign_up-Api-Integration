// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, use_build_context_synchronously

import 'package:api_integration/Repository/Repo.dart';
import 'package:api_integration/Routes/Routes_name.dart';
import 'package:api_integration/utills/utills.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ApiIntegViewmodel  with ChangeNotifier{
  final _myRepo = Repo();
  bool _loading = false;
  bool get loading => _loading;

  bool _SignUp_loading = false;
  bool get SignUp_loading => _SignUp_loading;
  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSIgnUploading(bool value) {
    _SignUp_loading = value;
    notifyListeners();
  }

  Future<void> login_api(dynamic data, BuildContext context) async {
    setloading(true);
    _myRepo
        .login_api(data)
        .then((value) {
          setloading(false);
          Utills.flushBarErrorMessages('Login Sucessfully', context);
          Navigator.pushNamed(context, RoutesName.home);
          if (kDebugMode) {
            print(value.toString());
          }
        })
        .onError((error, StackTrace) {
          setloading(false);
          Utills.flushBarErrorMessages(error.toString(), context);
          if (kDebugMode) {
            print(error.toString());
          }
        });
  }

  Future<void> SignUp_api(dynamic data, BuildContext context) async {
    setSIgnUploading(true);
    _myRepo.Sign_up_Api(data)
        .then((value) {
          setloading(false);
          Utills.flushBarErrorMessages('Sign Up Sucessfully', context);
          Navigator.pushNamed(context, RoutesName.home);
          if (kDebugMode) {
            print(value.toString());
          }
        })
        .onError((error, StackTrace) {
          setSIgnUploading(false);
          Utills.flushBarErrorMessages(error.toString(), context);
          if (kDebugMode) {
            print(error.toString());
          }
        });
  }
}
