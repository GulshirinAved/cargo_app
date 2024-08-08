import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../application/settings_singleton.dart';
import '../../../design/constants.dart';
import '../model/order_by_id_model.dart';

class GetOrderByIdProvider with ChangeNotifier {
  bool isLoading = false;
  TripDataIdModel? ordersById;

  static Dio dio = Dio();

  Future<void> getOrdersById(BuildContext context, int id) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? val = preferences.getString('token');

    isLoading = true;
    notifyListeners();
    print('-----------------------------------------------------------------');
    print(val);
    final headers = {
      'Authorization': 'Bearer $val',
    };
    print('${Constants.baseUrl}/cargo/fetch/$id');

    try {
      final response = await dio.get(
        '${Constants.baseUrl}/cargo/fetch/$id',
        options: Options(
          headers: headers
            ..addAll(
              {
                'Accept-Language': SettingsSingleton().locale.languageCode,
              },
            ),
        ),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        if (response.data != null) {
          ordersById = TripDataIdModel.fromJson(response.data['data']);
        }

        isLoading = false;
        notifyListeners();
        return;
      }
      // ignore: deprecated_member_use
    } on DioError {
      isLoading = false;

      notifyListeners();
    }
    return;
  }
}
