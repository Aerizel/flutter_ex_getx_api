import 'package:get/get.dart';
import 'package:getx_api/page/model/api_model.dart';
import 'package:getx_api/page/services/dio_service.dart';

class ApiController extends GetxController {
  RxList<ApiModel> posts = RxList();

  var url = "https://jsonplaceholder.typicode.com/posts";

  getPost() async {
    var response = await DioService().getMethod(url);

    if(response.statusCode == 200) {
      response.data.forEach((element) {
        posts.add(ApiModel.fromJson(element));
      });
    }
  }

  @override
  void onInit() {
    getPost();
    super.onInit();
  }
}