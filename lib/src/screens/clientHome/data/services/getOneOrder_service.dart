import 'package:dio/dio.dart';
import 'package:kargo_app/src/screens/clientHome/data/models/getOneOrder_model.dart';

class GetOneOrderService {
  final Dio dio = Dio();
  Future<List<Datum>> fetchOneOrder({required String userId}) async {
    final String oneOrderUrl =
        'https://106cargo.com.tm/api/collector/fetch-user-debt/${userId}';
    try {
      var headers = {
        'User-Agent': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer 1704|vwLSM4Nda8e7IFHy9X0rMa7ixgnvDKfH8xWmdUZz6b3b4b3d'
      };

      var response = await dio.get(
        oneOrderUrl,
        options: Options(
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        print('it is usel of one ordr ${oneOrderUrl}');
        List<dynamic> data = response.data['data'];
        return data.map((e) => Datum.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Error fetching order: $e');
    }
  }

  Future<User> fetchUserData({required String userId}) async {
    final String oneOrderUrl =
        'https://106cargo.com.tm/api/collector/fetch-user-debt/$userId';
    try {
      var headers = {
        'User-Agent': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer 1704|vwLSM4Nda8e7IFHy9X0rMa7ixgnvDKfH8xWmdUZz6b3b4b3d'
      };

      var response = await dio.get(
        oneOrderUrl,
        options: Options(
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        print('it is use of one order $oneOrderUrl');
        Map<String, dynamic> data = response.data['user'];
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
