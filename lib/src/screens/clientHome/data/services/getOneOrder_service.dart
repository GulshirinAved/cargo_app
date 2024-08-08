import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:kargo_app/src/screens/clientHome/clientHome_controller.dart';
import 'package:kargo_app/src/screens/clientHome/data/models/getOneOrder_model.dart';
import 'package:kargo_app/src/screens/custom_widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetOneOrderService {
  final Dio dio = Dio();
  Future<List<Datum>> fetchOneOrder({required String userId, required String ticketID}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? token = preferences.getString('token');
    final String oneOrderUrl = 'https://106cargo.com.tm/api/collector/fetch-user-debt/$userId?ticket_id=$ticketID&per_page=50&page=1';

    try {
      final headers = {'User-Agent': 'application/json', 'Accept': 'application/json', 'Authorization': 'Bearer $token'};

      final response = await dio.get(
        oneOrderUrl,
        options: Options(
          headers: headers,
        ),
      );
      print(oneOrderUrl);
      print('object');
      print(response.data);
      if (response.statusCode == 200) {
        print('it is usel of one ordr $oneOrderUrl');
        final List<dynamic> data = response.data['data'];
        return data.map((e) => Datum.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Error fetching order: $e');
    }
  }

  Future<List<Datum>> fetchOneOrderFromFilter({required String userId, required String ticketID, required String controller, required String controller1}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? token = preferences.getString('token');
    final String oneOrderUrl = 'https://106cargo.com.tm/api/collector/fetch-user-debt/$userId?ticket_id=$ticketID&from_transport_id=$controller&to_transport_id=$controller1&per_page=50&page=1';

    try {
      final headers = {'User-Agent': 'application/json', 'Accept': 'application/json', 'Authorization': 'Bearer $token'};

      final response = await dio.get(
        oneOrderUrl,
        options: Options(
          headers: headers,
        ),
      );
      print(oneOrderUrl);
      print('object');
      print(response.data);
      if (response.statusCode == 200) {
        print('it is usel of one ordr $oneOrderUrl');
        final List<dynamic> data = response.data['data'];
        return data.map((e) => Datum.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Error fetching order: $e');
    }
  }

  final ClientHomeController clientHomeController = Get.put(ClientHomeController());

  Future<List<PaymentModel>> getPaymentMethod({
    required String dateFrom,
    required String dateTo,
    required String ticket_search,
    required String from_transport_id,
    required String to_transport_id,
  }) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? token = preferences.getString('token');
    final String oneOrderUrl =
        'https://106cargo.com.tm/api/collector/get-payment-history?date_from=$dateFrom&date_to=$dateTo&ticket_search=$ticket_search&from_transport_id=$from_transport_id&to_transport_id=$to_transport_id';

    try {
      final headers = {'User-Agent': 'application/json', 'Accept': 'application/json', 'Authorization': 'Bearer $token'};

      final response = await dio.get(
        oneOrderUrl,
        options: Options(
          headers: headers,
        ),
      );
      print(oneOrderUrl);
      print('object');
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('it is usel of one ordr $oneOrderUrl');
        final List<dynamic> data = response.data['data'];
        print(data);
        print('______________________________________________________');
        if (data.isEmpty) {
          showSnackBar('Ýalňyşlyk', 'Maglumatlary dogry girizin', Colors.red);
        } else {
          final List<PaymentModel> data2 = response.data['data'].map((e) => PaymentModel.fromJson(e as Map<String, dynamic>)).toList();
          for (var e in data2) {
            clientHomeController.paymentHistory.add(e);
          }
        }
        return data.map((e) => PaymentModel.fromJson(e as Map<String, dynamic>)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Error fetching order: $e');
    }
  }

// {{cargo_l}}
  Future<User> fetchUserData({required String userId}) async {
    final String oneOrderUrl = 'https://106cargo.com.tm/api/collector/fetch-user-debt/$userId&per_page=50&page=1';
    try {
      final headers = {'User-Agent': 'application/json', 'Accept': 'application/json', 'Authorization': 'Bearer 1704|vwLSM4Nda8e7IFHy9X0rMa7ixgnvDKfH8xWmdUZz6b3b4b3d'};

      final response = await dio.get(
        oneOrderUrl,
        options: Options(
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data['user'];
        return User.fromJson(data);
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      print(e);
      throw Exception('Error fetching order: $e');
    }
  }
}
