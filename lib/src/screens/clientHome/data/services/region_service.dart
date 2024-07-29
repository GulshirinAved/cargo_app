import 'package:dio/dio.dart';
import 'package:kargo_app/src/screens/clientHome/data/models/region_model.dart';

class RegionService {
  final Dio dio = Dio();
  Future<List<Datum>> fetchRegion({required final String? id}) async {
    final String regionUrl =
        'https://106cargo.com.tm/api/collector/debt-list?region_id=$id';
    try {
      final headers = {
        'User-Agent': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer 1704|vwLSM4Nda8e7IFHy9X0rMa7ixgnvDKfH8xWmdUZz6b3b4b3d',
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
