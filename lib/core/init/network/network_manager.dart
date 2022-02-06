import 'package:dio/dio.dart';

import '../../constants/network/network_constants.dart';
import 'INetwork_Manager.dart';


class NetworkManager extends INetworkManager {
  static NetworkManager? _instance;
  NetworkManager._() {
    _dio = Dio(BaseOptions(baseUrl: NetworkConstants.BASE_URL));
  }
  static NetworkManager? get instance {
    _instance ??= NetworkManager._();
    return _instance;
  }

  late Dio _dio;

  @override
  Future dioGet(String endPoint) async {
    final response = await _dio.get<Map<String, dynamic>>(endPoint);

    return response.data;
  }
}
