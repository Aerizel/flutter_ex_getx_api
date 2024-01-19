import 'package:get/get.dart';
import '../model/api_model.dart';
import '../api/connection/api_sample/api_list.dart';

class ApiController extends GetxController {
  Future<List<ApiModel>> futureBuilding = Future.value([]);

  Future<List<ApiModel>> getFutureBuilding() async {
    final model = await ApiList.getApiData();
    return model;
  }

  Future<void> fetchApiSample() async {
    futureBuilding = getFutureBuilding();
  }
}