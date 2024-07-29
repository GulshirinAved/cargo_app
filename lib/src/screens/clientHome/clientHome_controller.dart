import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:kargo_app/src/screens/clientHome/data/models/meRegions_model.dart';
import 'package:kargo_app/src/screens/clientHome/data/services/meRegions_service.dart';

class ClientHomeController extends GetxController {
  RxString locationName = ''.obs;
  RxString locationId = ''.obs;
  RxString userId = ''.obs;

  RxList<Point> regionNames = <Point>[].obs;

  void selectLocation(
      {required String selectedLocation, required String regionId}) {
    locationName.value = selectedLocation;
    locationId.value = regionId;
  }

  void selectUserId({required String value}) {
    userId.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    fetchRegions();
  }

//this is fetched data for tabbar
  void fetchRegions() async {
    List<Point> fetchedRegions = [];
    try {
      fetchedRegions = await MeRegionService().fetchRegionNames();
      regionNames.assignAll(fetchedRegions);
    } catch (e) {
      print('Error fetching regions: $e');
    } finally {
      if (regionNames.isNotEmpty) {
        locationName.value = regionNames.first.name ?? '';
        locationId.value = regionNames.first.id.toString();
      } else if (fetchedRegions.isNotEmpty) {
        locationName.value = fetchedRegions.first.name ?? '';
        locationId.value = regionNames.first.id.toString();
      } else {
        locationName.value = '';
      }
    }
  }
}
