import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';

final Dio dio = Dio()..interceptors.add(AwesomeDioInterceptor());
