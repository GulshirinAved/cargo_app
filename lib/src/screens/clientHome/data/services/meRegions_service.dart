import 'package:dio/dio.dart';
import 'package:kargo_app/src/screens/clientHome/data/models/meRegions_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MeRegionService {
  final Dio dio = Dio();

  Future<List<Point>> fetchRegionNames() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? token = preferences.getString('token');
    final String regionUrl = 'https://106cargo.com.tm/api/auth/me';

    try {
      var headers = {
        'User-Agent': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}'
      };

      var response = await dio.get(
        regionUrl,
        options: Options(
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        if (response.data['data'] != null &&
            response.data['data']['points'] is List) {
          List<Point> data = (response.data['data']['points'] as List)
              .map((item) => Point.fromJson(item))
              .toList();
          return data;
        } else {
          throw Exception('Invalid data format');
        }
      } else {
        throw Exception('Failed to load regions');
      }
    } catch (e) {
      throw Exception('Error fetching regions: $e');
    }
  }
}
