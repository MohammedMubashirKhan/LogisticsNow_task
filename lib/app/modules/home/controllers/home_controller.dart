import 'dart:convert';

import 'package:get/get.dart';
import 'package:logisticnow_task/app/modules/home/model/search_model.dart';
import 'package:logisticnow_task/app/services/api_services.dart';

class HomeController extends GetxController {
  Rxn<SearchModel> searchModel = Rxn<SearchModel>();

  /// Call API with searchValue
  onSearhFieldChange(String searchValue) async {
    if (searchValue.length > 2) {
      String? data = await ApiServices().getApi(searchValue);
      if (data != null) {
        searchModel.value = SearchModel.fromJson(jsonDecode(data));
      }
    } else {
      searchModel.value = null;
    }
  }
}
