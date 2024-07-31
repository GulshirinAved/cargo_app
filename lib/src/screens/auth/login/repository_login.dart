import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  String? tokens;
  bool isLoading = false;
  static Dio dio = Dio();

  Future<bool> login(
    BuildContext context,
    String phone,
    String password,
  ) async {
    try {
      final response = await dio.post(
        'https://106cargo.com.tm/api/auth/login',
        data: jsonEncode({'phone': phone, 'password': password}),
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );
      isLoading = true;
      if (response.statusCode == 200) {
        isLoading = false;
        final SharedPreferences preferences = await SharedPreferences.getInstance();

        tokens = response.data['data']['token'];
        await preferences.setString('token', tokens!);
        await preferences.setBool(
          'is_collector',
          response.data['data']['user']['is_collector']!,
        );

        return response.data['data']['user']['is_collector'];
      }
    } on DioException {
      isLoading = false;
    }
    return false;
  }
}

class LogOutRepository {
  bool isLoading = false;
  static Dio dio = Dio();

  Future<bool?> logOut(
    BuildContext context,
    String tokens,
  ) async {
    final headers = {
      'Authorization': 'Bearer $tokens',
    };
    try {
      final response = await dio.post(
        'https://106cargo.com.tm/api/auth/logout',
        options: Options(headers: headers),
      );
      isLoading = true;

      if (response.statusCode == 200) {
        isLoading = false;
        final SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.remove('token');

        return response.statusCode == 200 ? true : false;
      }
    } on DioException {
      isLoading = false;
    }
    return false;
  }
}
