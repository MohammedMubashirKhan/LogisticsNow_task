import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:logisticnow_task/app/modules/home/model/search_model.dart';
import 'package:logisticnow_task/app/services/api_services.dart';

class HomeController extends GetxController {
  Rx<TextEditingController> searchController = TextEditingController().obs;
  Rxn<SearchModel> searchModel = Rxn<SearchModel>();
  final _debouncer = Debouncer(
      delay:
          const Duration(milliseconds: 500)); // Debounce time in milliseconds
  RxBool isLoading = false.obs;

  /// Call API with searchValue
  onSearhFieldChange(String searchValue) async {
    _debouncer.call(() async {
      isLoading.value = true;
      if (searchValue.length > 2) {
        String? data = await ApiServices().getApi(searchValue);
        if (data != null) {
          searchModel.value = SearchModel.fromJson(jsonDecode(data));
        }
        searchController.refresh();
      } else {
        searchModel.value = null;
      }
      isLoading.value = false;
    });
  }
}
