import 'package:api_integration/Response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse({this.data, this.status, this.message});
  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed() : status = Status.COMPLETED;
  ApiResponse.error() : status = Status.ERROR;

  String to_string() {
    return "Status $status \n Message $message \n Data $data";
  }
}
