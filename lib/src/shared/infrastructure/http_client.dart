import 'dart:developer';

import 'package:dio/dio.dart';

import '../presentation/utils/const.dart';

final baseOptions = BaseOptions(
  baseUrl: baseUrl,
  headers: {
    'Content-Type': 'application/json; charset=utf-8',
  },
);

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    const clientId = 'ikefu3gjaojsnnt21ik7orxyofnztq';
    const clientToken = 'q40aq120dooi6sa9ka80r8i5bormxm';

    log('AUTH TOKEN: $clientToken');

    final authorizationHeader = {
      'Client-ID': clientId,
      'Authorization': 'Bearer $clientToken',
    };

    options.headers.addAll(authorizationHeader);

    return super.onRequest(options, handler);
  }
}
