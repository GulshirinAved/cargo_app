import 'package:dio/dio.dart';
import 'package:kargo_app/src/screens/clientHome/data/models/region_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegionService {
  final Dio dio = Dio();
  Future<List<Datum>> fetchRegion({required final String? id}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? token = preferences.getString('token');
    final String regionUrl =
        'https://106cargo.com.tm/api/collector/debt-list?region_id=$id';
    try {
      final headers = {
        'User-Agent': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      };
      final Response response = await dio.get(
        regionUrl,
        options: Options(
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        return data.map((e) => Datum.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Error fetching regions: $e');
    }
  }
}
