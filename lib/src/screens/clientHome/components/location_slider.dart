import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kargo_app/src/screens/clientHome/clientHome_controller.dart';
import 'package:kargo_app/src/screens/clientHome/components/location_card.dart';

class LocationSlider extends StatelessWidget {
  const LocationSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ClientHomeController clientHomeController =
        Get.find<ClientHomeController>();
    return Obx(
      () => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: clientHomeController.regionNames.length,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemBuilder: (context, index) => LocationCard(
            locationName: clientHomeController.regionNames[index].name ?? '',
            locationId: clientHomeController.regionNames[index].id.toString(),
          ),
        ),
      ),
    );
  }
}
