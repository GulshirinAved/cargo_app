// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../design/constants.dart';

class SendFcmTokenRepository {
  bool isLoading = false;
  static Dio dio = Dio();

  Future<void> sendToken(
    String fcmToken,
  ) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? val = preferences.getString('token');

    final headers = {
      'Authorization': 'Bearer $val',
      'Content-Type': 'application/json',
    };
    try {
      final response = await dio.patch(
        '${Constants.baseUrl}/auth/update-token',
        data: jsonEncode({
          'fcm_token': fcmToken,
        }),
        options: Options(
          headers: headers,
        ),
      );
      isLoading = true;
      print(response.data);
      if (response.statusCode == 200) {
        isLoading = false;
        print(response.data);

        return;
      }
    } on DioException catch (e) {
      isLoading = false;
      print('fuckkkkk');
      print(e.error);
      if (e.response != null) {
        print('Error= ${e.response!.realUri}');
      }
      if (e.response != null) {
        print(e.response!.data);
      }
    }
    return;
  }
}
