import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';
import '../../model/api_model.dart';

class ApiList extends StatelessWidget {
  const ApiList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api data list"),
      ),
      body: GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) {
          controller.apiController.fetchApiSample(); //Auto fetch data
          return FutureBuilder(
            future: controller.apiController.futureBuilding,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ApiModel> apiData = snapshot.data as List<ApiModel>;
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.separated(
                    itemCount: apiData.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(apiData[index].id.toString()),
                        title: Text(apiData[index].title.toString()),
                        subtitle: Text(apiData[index].body.toString()),
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
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        },
      ),
    );
  }
}
