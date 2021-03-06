import 'package:dio/dio.dart';

enum Method {
  POST,
  GET,
}

class DioClient {
  static Future<Response> callApi(String url, Map<String, dynamic> payload,
      {Method method = Method.GET}) async {
    Dio dio = Dio();
    // dio.interceptors.add(PrettyDioLogger(
    //     requestHeader: true,
    //     requestBody: true,
    //     responseBody: true,
    //     responseHeader: false,
    //     error: true,
    //     compact: true,
    //     maxWidth: 100));
    Response response;
    if (method == Method.POST) {
      response = await dio.post(url, queryParameters: payload);
    } else {
      response = await dio.get(url, queryParameters: payload);
    }

    return response;
  }
}
