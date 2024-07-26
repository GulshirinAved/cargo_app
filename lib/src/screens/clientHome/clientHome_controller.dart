import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class ClientHomeController extends GetxController {
  RxString locationName = ''.obs;
  void selectLocation({required String selectedLocation}) {
    locationName.value = selectedLocation;
  }
}
