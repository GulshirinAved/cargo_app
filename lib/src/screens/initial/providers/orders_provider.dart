import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getWidget;
import 'package:kargo_app/src/screens/initial/providers/initial_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../design/constants.dart';
import '../model/orders_model.dart';

class OrdersProvider with ChangeNotifier {
  bool isLoading = false;
  List<TripModel> orders = [];
  List<TripModel> pointsget = [];
  final InitialPageController initialPageController = getWidget.Get.put(InitialPageController());

  static Dio dio = Dio();

  Future<void> getOrders({
    required int page,
    required int limit,
  }) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? val = preferences.getString('token');
    orders = [];
    pointsget = [];
    final headers = {
      'Authorization': 'Bearer $val',
    };
    print(
      '${Constants.baseUrl}/cargo/list?per_page=$limit&page=$page',
    );
    print(val);
    try {
      final response = await dio.get(
        '${Constants.baseUrl}/cargo/list?per_page=$limit&page=$page',
        options: Options(headers: headers),
      );
      isLoading = true;
      print(response.statusCode);

      print(val);

      print(response.data);
      if (response.statusCode == 200) {
        if (response.data != null) {
          orders = List<TripModel>.from(
            response.data['data'].map((e) {
              return TripModel.fromJson(e);
            }),
          );

          for (var item in orders) {
            if (item.points != null) {
              pointsget.add(item);
            }
          }
          isLoading = false;
          notifyListeners();
          initialPageController.loading.value = 3;
          for (var a in orders) {
            final bool exists = initialPageController.showOrders.any((item) => item['id'] == a.id);
            if (!exists) {
              initialPageController.showOrders.add({
                'id': a.id.toString(),
                'date': a.date.toString(),
                'point_from': a.pointFrom,
                'ticket_code': a.ticketCode,
                'point_to': a.pointTo,
                'track_code': a.trackCode,
                'summary_seats': a.summarySeats,
                'location': a.location,
                'points': a.points,
              });
            }
          }
        } else {
          initialPageController.loading.value = 2;
          return;
        }

        return;
      }
    } on DioException catch (e) {
      isLoading = true;
      if (e.response != null) print('Error= ${e.response!.realUri}');
      if (e.response != null) print(e.response!.data);
      notifyListeners();
      initialPageController.loading.value = 1;
    }
    return;
  }
}
