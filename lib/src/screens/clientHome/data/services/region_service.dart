import 'package:dio/dio.dart';
import 'package:get/get.dart' as getWidget;
import 'package:kargo_app/src/screens/clientHome/clientHome_controller.dart';
import 'package:kargo_app/src/screens/clientHome/data/models/region_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegionService {
  final Dio dio = Dio();
  Future<List<Datum>> fetchRegion({
    required String id,
    required int page,
    required int limit,
  }) async {
    final ClientHomeController clientHomeController = getWidget.Get.put(ClientHomeController());

    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? token = preferences.getString('token');
    final String regionUrl = 'https://106cargo.com.tm/api/collector/debt-list?region_id=$id&per_page=$limit&page=$page';
    try {
      final headers = {
        'User-Agent': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final Response response = await dio.get(
        regionUrl,
        options: Options(
          headers: headers,
        ),
      );
      print(regionUrl);
      if (response.statusCode == 200) {
        clientHomeController.loading.value = 3;
        final List<dynamic> data = response.data['data'];
        for (final Map product in data) {
          final bool exists = clientHomeController.showUsersList.any((item) => item['id'] == product['id']);
          if (!exists) {
            clientHomeController.showUsersList.add({
              'id': product['id'],
              'userName': product['user_name'],
              'debt': product['debt'],
              'phone': product['phone'],
            });
          }
        }
        return data.map((e) => Datum.fromJson(e)).toList();
      } else {
        clientHomeController.loading.value = 1;
        return [];
      }
    } catch (e) {
      throw Exception('Error fetching regions: $e');
    }
  }
}
