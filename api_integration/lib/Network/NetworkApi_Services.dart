import 'dart:convert';

import 'package:api_integration/Network/BaseApi_response.dart';
import 'package:api_integration/Response/App_Exception.dart';
import 'package:http/http.dart' as http;

class NetworkapiServices extends BaseapiResponse {
  @override
  //Future function for get api
  Future<dynamic> getApi(String url) async {
    // dynamic responseJson;
  }

  @override
  //Future function for post api
  Future<dynamic> postApi(String url, dynamic data) async {
    // dynamic responseJson;
  }

  //return Response
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        {
          dynamic responseJson = jsonDecode(response.body);
          return responseJson;
        }

      case 400:
        {
          throw BadRequestException(response.body.toString());
        }

      case 404:
        {
          throw UnAuthException(response.body.toString());
        }

      default:
        {
          throw FetchDataException(
            'Error occured while communicating with server: ${response.statusCode}',
          );
        }
    }
  }
}
