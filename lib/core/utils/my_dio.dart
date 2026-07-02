import 'dart:convert';
import 'dart:developer';
import 'package:demo/core/utils/api_paths.dart';
import 'package:demo/presentation/widgets/custom_snackbar.dart';
import 'package:dio/dio.dart';
import 'auth.dart';

class MyDio {
  late Dio dio;

  MyDio() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiPaths.baseUrl,
        receiveDataWhenStatusError: true,
        responseType: ResponseType.plain,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          Headers.contentTypeHeader: Headers.jsonContentType,
          if (Auth.accessToken.isNotEmpty)
            "Authorization": "Bearer ${Auth.accessToken}",
        },
      ),
    );

    // dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onError: (error, handler) async {
    //       if (error.response?.statusCode == 401 ||
    //           error.response?.statusCode == 403) {
    //         if (Auth.refreshToken.isNotEmpty) {
    //           try {
    //             Auth.accessToken = "";
    //             dynamic resp = await AuthRepository.getAccessToken();

    //             // if (resp is ValidationModel) {
    //             if (resp.access?.isNotEmpty ?? false) {
    //               Auth.accessToken = resp.access!;
    //               // }
    //             } else {
    //               CustomSnackbar.showError(resp.message ?? "Failed");

    //               LocalStorage.clearData();
    //               openAsNewPage(const LoginScreen());
    //             }

    //             if (Auth.accessToken.isEmpty) {
    //               return handler.reject(error);
    //             }

    //             // Clone the original request
    //             final opts = error.requestOptions;
    //             opts.headers['Authorization'] = 'Bearer ${Auth.accessToken}';

    //             // Retry the original request with the new token
    //             final retryResponse = await dio.request(
    //               opts.path,
    //               options: Options(
    //                 method: opts.method,
    //                 headers: opts.headers,
    //                 contentType: opts.contentType,
    //                 responseType: opts.responseType,
    //               ),
    //               data: opts.data,
    //               queryParameters: opts.queryParameters,
    //             );

    //             // Return the response from the retried request
    //             return handler.resolve(retryResponse);
    //             // }
    //           } on DioException catch (e) {
    //             // Handle errors during the token refresh process
    //             return handler.reject(e);
    //           }
    //         } else {
    //           CustomSnackbar.snackbar(
    //             message: "Session expired",
    //             isFailed: true,
    //           );
    //           openAsNewPage(const LoginScreen(isLogin: true));
    //         }
    //       }

    //       // If the status code is not 401, pass the error on to the handler
    //       return handler.next(error);
    //     },
    //   ),
    // );
  }

  Future<dynamic> get({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response resp = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      printSuccessDetails(resp: resp);
      return jsonDecode(resp.data);
    } on DioException catch (ex) {
      printFailedDetails(ex: ex);
      return ex;
    }
  }

  Future<dynamic> post({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response resp = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      printSuccessDetails(resp: resp);
      return jsonDecode(resp.data);
    } on DioException catch (ex) {
      printFailedDetails(ex: ex);
      return ex;
    }
  }

  void printSuccessDetails({required Response resp}) {
    log("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
    log(
      "STATUSCODE[${resp.statusCode}] => PATH: ${resp.requestOptions.baseUrl + resp.requestOptions.path}",
    );
    log("ResMethodType : [${resp.requestOptions.method}]");
    log("Headers: ${resp.requestOptions.headers}");
    log("QueryParameters : ${resp.requestOptions.queryParameters.toString()}");
    log("Body: ${resp.requestOptions.data}");

    // if (resp.requestOptions.data != null) {
    //   log("Body: ${jsonEncode(resp.requestOptions.data)}");
    // }
    log('resp >>> ${resp.data}');

    log("************** Response End ************************");
  }

  void printFailedDetails({required DioException ex}) {
    log("!!!!!!!!!!!!!! Error Begin !!!!!!!!!!!!!!!!!!!!!");
    log(
      "REQUEST[${ex.response?.statusCode}] => PATH: ${ex.requestOptions.baseUrl + ex.requestOptions.path}",
    );
    log("ResMethodType : [${ex.requestOptions.method}]");
    log("Headers: ${ex.requestOptions.headers}");
    log("QueryParameters : ${ex.requestOptions.queryParameters.toString()}");
    log("Body: ${ex.requestOptions.data}");

    // if (ex.requestOptions.data != null) {
    //   log("Body: ${jsonEncode(ex.requestOptions.data)}");
    // }
    log("Resp >>> ${ex.response}");
    log('error type >>> ${ex.type}');
    log("EXCEPTION : ${ex.message}");
    log("************** Error End ************************");

    String? message = ex.type.name;

    if (ex.type == DioExceptionType.badResponse && ex.response?.data != null) {
      dynamic data = jsonDecode(ex.response?.data);

      message = (data is Map ? data['detail']?.toString() : null);
    }

    CustomSnackbar.showError(message ?? "Something went wrong");
  }
}
