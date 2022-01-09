import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fashion/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
  * Request operation class
  * Singleton mode
  * Manual
  * https://github.com/flutterchina/dio/blob/master/README-ZH.md
  *
*/
class RequestUtil {
  static RequestUtil _instance = RequestUtil._internal();
  factory RequestUtil() => _instance;

  late Dio dio;

  RequestUtil._internal() {
    // BaseOptions, Options, RequestOptions can all be configured with parameters, the priority level increases sequentially, and the parameters can be overridden according to the priority level
    BaseOptions options = new BaseOptions(
      // Request base address, can include sub-path
      baseUrl: SERVER_API_URL,
      // Timeout for connecting to the server, in milliseconds.
      connectTimeout: 10000,

      // The interval between the two received data on the response stream, in milliseconds.
      receiveTimeout: 5000,

      // Http request header.
      headers: {},

      /// The requested Content-Type, the default value is "application/json; charset=utf-8".
      /// If you want to encode the request data in "application/x-www-form-urlencoded" format,
      /// You can set this option to `Headers.formUrlEncodedContentType` , so [Dio]
      /// The request body will be automatically encoded.
      contentType: 'application/json; charset=utf-8',

      /// [responseType] indicates that the response data is expected to be received in that format (method).
      /// Currently [ResponseType] accepts three types `JSON` , `STREAM` , `PLAIN` .
      ///
      /// The default value is `JSON` , when the content-type in the response header is "application/json", dio will automatically convert the response content into a json object.
      /// If you want to receive the response data in a binary format, such as downloading a binary file, you can use `STREAM` .
      ///
      /// If you want to receive the response data in text (string) format, please use `PLAIN`.
      responseType: ResponseType.json,
    );

    dio = new Dio(options);

    // add interceptor
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // do something before the request is sent
        return handler.next(options); //continue
      },
      onResponse: (Response response, handler) {
        // Do some preprocessing before returning the response data
        return handler.next(response); // continue
      },
      onError: (DioError e, handler) {
        // do some preprocessing when the request fails
        return handler.next(e);
      },
    ));
  }

  /*
   * Get token
   */
  getAuthorizationHeader() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('token');
  }

  /// get operation
  Future get(
    String path, {
    dynamic params,
    Options? options,
  }) async {
    try {
      Options requestOptions = options ?? Options();

      /// The following three lines of code are the operation of obtaining the token and then merging it into the header
      Map<String, dynamic> _authorization = {"token": getAuthorizationHeader()};
      requestOptions = requestOptions.copyWith(headers: _authorization);
      var response = await dio.get(
        path,
        queryParameters: params,
        options: requestOptions,
      );
      return response.data;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }

  ///  post operation
  Future post(String path, {dynamic params, Options? options}) async {
    Options requestOptions = options ?? Options();

    /// The following three lines of code are the operation of obtaining the token and then merging it into the header
    // Map<String, dynamic> _authorization = getAuthorizationHeader();
    // if (_authorization != null) {
    //   requestOptions = requestOptions.merge(headers: _authorization);
    // }
    var response = await dio.post(path, data: params, options: requestOptions);
    return response.data;
  }

  ///  put operation
  Future put(String path, {dynamic params, Options? options}) async {
    Options requestOptions = options ?? Options();

    /// The following three lines of code are the operation of obtaining the token and then merging it into the header
    // Map<String, dynamic> _authorization = getAuthorizationHeader();
    // if (_authorization != null) {
    //   requestOptions = requestOptions.merge(headers: _authorization);
    // }
    var response = await dio.put(path, data: params, options: requestOptions);
    return response.data;
  }

  ///  patch operation
  Future patch(String path, {dynamic params, Options? options}) async {
    Options requestOptions = options ?? Options();

    /// The following three lines of code are the operation of obtaining the token and then merging it into the header
    // Map<String, dynamic> _authorization = getAuthorizationHeader();
    // if (_authorization != null) {
    //   requestOptions = requestOptions.merge(headers: _authorization);
    // }
    var response = await dio.patch(path, data: params, options: requestOptions);
    return response.data;
  }

  /// delete operation
  Future delete(String path, {dynamic params, Options? options}) async {
    Options requestOptions = options ?? Options();

    /// The following three lines of code are the operation of obtaining the token and then merging it into the header
    // Map<String, dynamic> _authorization = getAuthorizationHeader();
    // if (_authorization != null) {
    //   requestOptions = requestOptions.merge(headers: _authorization);
    // }
    var response =
        await dio.delete(path, data: params, options: requestOptions);
    return response.data;
  }

  ///  post form form submission operation
  Future postForm(String path, {dynamic params, Options? options}) async {
    Options requestOptions = options ?? Options();

    /// The following three lines of code are the operation of obtaining the token and then merging it into the header
    // Map<String, dynamic> _authorization = getAuthorizationHeader();
    // if (_authorization != null) {
    //   requestOptions = requestOptions.merge(headers: _authorization);
    // }
    var response = await dio.post(path,
        data: FormData.fromMap(params), options: requestOptions);
    return response.data;
  }
}

/*
   * Error unified processing
   */
// error message
ErrorEntity createErrorEntity(DioError error) {
  switch (error.type) {
    case DioErrorType.cancel:
      {
        return ErrorEntity(code: -1, message: "Cancel Request");
      }
    case DioErrorType.connectTimeout:
      {
        return ErrorEntity(code: -1, message: "Connection Timeout");
      }

    case DioErrorType.sendTimeout:
      {
        return ErrorEntity(code: -1, message: "Request Timeout");
      }

    case DioErrorType.receiveTimeout:
      {
        return ErrorEntity(code: -1, message: "Response Timeout");
      }
    case DioErrorType.response:
      {
        try {
          int? errCode = error.response?.statusCode;
          if (errCode == null) {
            return ErrorEntity(code: -2, message: error.message);
          }
          switch (errCode) {
            case 400:
              {
                return ErrorEntity(
                    code: errCode, message: "Request syntax error");
              }
            case 401:
              {
                return ErrorEntity(code: errCode, message: "No permission");
              }

            case 403:
              {
                return ErrorEntity(
                    code: errCode, message: "Server refused to execute");
              }

            case 404:
              {
                return ErrorEntity(
                    code: errCode, message: "Unable to connect to the server");
              }

            case 405:
              {
                return ErrorEntity(
                    code: errCode, message: "Request method is forbidden");
              }

            case 500:
              {
                return ErrorEntity(
                    code: errCode, message: "Server internal error");
              }

            case 502:
              {
                return ErrorEntity(code: errCode, message: "Invalid request");
              }

            case 503:
              {
                return ErrorEntity(
                    code: errCode, message: "The server is down");
              }

            case 505:
              {
                return ErrorEntity(
                    code: errCode,
                    message: "Http protocol request is not supported");
              }

            default:
              {
                // return ErrorEntity(code: errCode, message: "Unknown error");
                return ErrorEntity(
                    code: errCode,
                    message: error.response?.statusMessage ?? '');
              }
          }
        } on Exception catch (_) {
          return ErrorEntity(code: -1, message: "Unknown error");
        }
      }

    default:
      {
        return ErrorEntity(code: -1, message: error.message);
      }
  }
}

// exception handling
class ErrorEntity implements Exception {
  int code;
  String? message;
  ErrorEntity({required this.code, this.message});

  String toString() {
    if (message == null) return "Exception";
    return "Exception: code $code, $message";
  }
}
