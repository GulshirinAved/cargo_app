// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../bottom_nav/bottom_nav_screen.dart';
import '../../../design/constants.dart';

class RegisterRepository {
  String? tokens;
  bool isLoading = false;
  static Dio dio = Dio();

  Future<void> register(
    BuildContext context,
    String firstName,
    String lastName,
    String phone,
    String password,
    String passwordConfirmation,
  ) async {
    try {
      final response = await dio.post(
        '${Constants.baseUrl}/auth/register',
        data: jsonEncode({
          'first_name': firstName,
          'last_name': lastName,
          'phone': phone,
          'password': password,
          'password_confirmation': passwordConfirmation,
        }),
        options: Options(headers: {
          'Content-Type': 'application/json',
        },),
      );

      isLoading = true;
      print(response.data);
      if (response.statusCode == 200) {
        isLoading = false;
        final SharedPreferences preferences = await SharedPreferences.getInstance();

        tokens = response.data!['data']['token'];
        await preferences.setString('token', tokens!);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const BottomNavScreen()),);

        return;
      }
    } on DioError catch (e) {
      isLoading = false;
      print('fuckkkkk');
      print(e.error);
      print('${e.response?.statusCode} it is sttaus code');
      print('${e.response?.statusMessage} it is sttaus message');

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
