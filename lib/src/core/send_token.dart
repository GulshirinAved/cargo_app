import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../design/constants.dart';

class SendFcmTokenRepository {
  bool isLoading = false;
  static Dio dio = Dio();

  Future<void> sendToken(
    String fcm_token,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? val = preferences.getString('token');

    final headers = {
      'Authorization': 'Bearer $val',
      'Content-Type': 'application/json',
    };
    try {
      var response = await dio.patch(
        "${Constants.baseUrl}/auth/update-token",
        data: jsonEncode({
          "fcm_token": fcm_token,
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
    } on DioError catch (e) {
      isLoading = false;
      print('fuckkkkk');
      print(e.error);
      if (e.response != null) print("Error= ${e.response!.realUri}");
      if (e.response != null) print(e.response!.data);
    }
    return;
  }
}
