// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kargo_app/src/design/app_colors.dart';
import 'package:kargo_app/src/screens/clientHome/clientHome_controller.dart';

class LocationCard extends StatelessWidget {
  final String locationName;
  final String locationId;
  const LocationCard({
    required this.locationName,
    required this.locationId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ClientHomeController clientHomeController =
        Get.put(ClientHomeController());
    return GestureDetector(
      onTap: () => clientHomeController.selectLocation(
          selectedLocation: locationName, regionId: locationId,),
      child: Obx(() => Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: clientHomeController.locationName == locationName
                  ? AppColors.blueColor.withOpacity(0.2)
                  : AppColors.grey1Color,
              borderRadius: const BorderRadius.all(
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
          ),),
    );
  }
}
