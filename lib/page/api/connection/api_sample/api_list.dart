import 'package:dio/dio.dart';
import '../../../model/api_model.dart';
import '../../api.dart';

class ApiList {
  static Future<List<ApiModel>> getApiData() async {
    try {
      final res = await apiSample.get('https://jsonplaceholder.typicode.com/posts');
      List json = res.data;
      List<ApiModel> list = [];
      list = json.map((data) => ApiModel.fromJson(data)).toList();
    
      return list;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}