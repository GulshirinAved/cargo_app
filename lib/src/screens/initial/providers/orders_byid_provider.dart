import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../design/constants.dart';
import '../model/order_by_id_model.dart';

class GetOrderByIdProvider with ChangeNotifier {
  bool isLoading = false;
  TripDataIdModel? ordersById;

  int loc = 0;
  @override
  notifyListeners();
  static Dio dio = Dio();

  Future<void> getOrdersById(int id) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? val = preferences.getString('token');
    final headers = {
      'Authorization': 'Bearer $val',
    };
    print(val);

    try {
      final response = await dio.get(
        '${Constants.baseUrl}/cargo/fetch/$id',
        options: Options(headers: headers),
      );
      isLoading = true;
      print(response.data);
      print('${Constants.baseUrl}/cargo/fetch/$id');
      if (response.statusCode == 200) {
        if (response.data != null) {
          ordersById = TripDataIdModel.fromJson(response.data['data']);
        }

        isLoading = false;
        notifyListeners();
        return;
      }
    } on DioException catch (e) {
      isLoading = false;
      print('fuckkkkk');
      print(e.error);
      if (e.response != null) print('Error= ${e.response!.realUri}');
      if (e.response != null) print(e.response!.data);

      notifyListeners();
    }
    return;
  }
}
