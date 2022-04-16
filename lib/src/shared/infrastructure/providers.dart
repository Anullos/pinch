import 'package:dio/dio.dart';

import 'http_client.dart';

final dioInstanceClient = Dio(baseOptions)..interceptors.add(AuthInterceptor());