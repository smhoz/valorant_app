import 'package:dio/dio.dart';
import '../../../core/init/network/exception/network_exception.dart';
import '../../../core/init/network/network_manager.dart';
import '../model/valorant_model.dart';
import 'IHomeService.dart';

class HomeService extends IHomeService {
  final String endPoint = "/v1/agents";
  
  @override
  Future dioGet() async {
    try {
      final response = await NetworkManager.instance?.dioGet(endPoint);

      return ValorantModel.fromJson(response);
    } on DioError catch (error) {
      return NetworkExceptions.getDioException(error);
    }
  }
}
