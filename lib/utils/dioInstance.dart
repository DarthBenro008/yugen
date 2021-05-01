import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yugen/utils/tokenGenerator.dart';

class DioInstance {
  late Dio dio;

  Future<Dio> getDioInstance() async {
    TokenGenerator tokenGenerator = new TokenGenerator();
    if (dio == null) {
      IdTokenResult idTokenResult = await tokenGenerator.fetchFirebaseToken();
      print("THIS IS TOKEN ${idTokenResult.toString()}");
      BaseOptions options = new BaseOptions(
          baseUrl: "https://yugen-backend.benro.tech/api/v1/",
          connectTimeout: 9000,
          receiveTimeout: 5000,
          headers: {'Authorization': idTokenResult.token});
      dio = new Dio(options);
      dio.interceptors.add(LogInterceptor());
      return dio;
    } else {
      print("Reuse of Dio Detected");
      return dio;
    }
  }
}
