import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kargo_app/src/design/app_colors.dart';
import 'package:kargo_app/src/screens/clientHome/clientHome_controller.dart';

class LocationCard extends StatelessWidget {
  final String locationName;
  const LocationCard({
    required this.locationName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ClientHomeController clientHomeController =
        Get.put(ClientHomeController());
    return GestureDetector(
      onTap: () =>
          clientHomeController.selectLocation(selectedLocation: locationName),
      child: Obx(() => Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: clientHomeController.locationName == locationName
                  ? AppColors.blueColor.withOpacity(0.2)
                  : AppColors.grey1Color,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Text(
              locationName,
              style: TextStyle(
                color: clientHomeController.locationName == locationName
                    ? AppColors.blueColor
                    : AppColors.lightBlueColor,
                fontFamily: 'ALSHauss',
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          )),
    );
  }
}
