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
              decoration: const InputDecoration(
                hintText: 'Search Place',
              ),
              onChanged: controller.onSearhFieldChange,
            ),
            const SizedBox(
              height: 24.0,
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
