import 'package:dio/dio.dart';
import 'network_constant.dart';

class NetworkManager {
  late Dio network;
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  NetworkManager._init() {
    network = _networkManager(NetworkContant.baseUrl);
  }

  Dio _networkManager(String baseUrl) {
    return Dio(
      BaseOptions(baseUrl: baseUrl),
    )..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            options.headers['Authorization'] = NetworkContant.accessToken;
            handler.next(options);
          },
        ),
      );
  }
}
