// ignore_for_file: unused_field, empty_catches, use_rethrow_when_possible

import 'package:api_integration/Network/BaseApi_response.dart';
import 'package:api_integration/Network/NetworkApi_Services.dart';
import 'package:api_integration/Resources/Componenet/App_url.dart';

class Repo {
  BaseapiResponse _baseapiResponse = NetworkapiServices();

  Future<dynamic> login_api(dynamic data) async {
    try {
      dynamic response = await _baseapiResponse.postApi(
        AppUrl.loginEndPoint,
        data,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> Sign_up_Api(dynamic data) async {
    try {
      final response = await _baseapiResponse.postApi(
        AppUrl.RegisterapiEndPoint,
        data,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }
}
