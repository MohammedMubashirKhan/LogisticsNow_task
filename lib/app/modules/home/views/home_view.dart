import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            TextField(
              controller: controller.searchController.value,
              decoration: const InputDecoration(
                hintText: 'Search Place',
              ),
              onChanged: controller.onSearhFieldChange,
            ),
            const SizedBox(
              height: 24.0,
            ),
            Obx(() {
              // when user hasn't type anything
              if (controller.searchController.value.text.length <= 2) {
                return const Center(
                  child: Text("Type more than  2 character to search"),
                );
              }

              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              // When no data found
              if (controller.searchModel.value?.value?.isEmpty ?? true) {
                return const Center(
                  child: Text("No data found"),
                );
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: controller.searchModel.value?.value?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Obx(
                      () {
                        var item = controller.searchModel.value?.value?[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text("${item?.locationName}"),
                                subtitle: Text(
                                  'District: ${item?.location?.district}, State: ${item?.location?.state}',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Coordinates: ${item?.location?.lat}, ${item?.location?.lon}',
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
