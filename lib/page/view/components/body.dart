import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/page/controller/api_controller.dart';

class ApiList extends StatelessWidget {
  const ApiList({super.key});

  @override
  Widget build(BuildContext context) {
    
    final ApiController apiController = Get.put(ApiController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Api data list"),
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.separated(
            itemCount: apiController.posts.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(apiController.posts[index].id.toString()),
                title: Text(apiController.posts[index].title.toString()),
                subtitle: Text(apiController.posts[index].body.toString()),
              );
            },
            separatorBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Divider(
                  color: Colors.grey[300],
                  height: 3,
                  thickness: 2,
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
