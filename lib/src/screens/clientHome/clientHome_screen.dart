// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kargo_app/src/design/app_colors.dart';
import 'package:kargo_app/src/screens/CustomWidgets/client_bottomSheet.dart';
import 'package:kargo_app/src/screens/CustomWidgets/custom_appbar.dart';
import 'package:kargo_app/src/screens/clientHome/clientHome_controller.dart';
import 'package:kargo_app/src/screens/clientHome/components/clientInfoCard_slider.dart';
import 'package:kargo_app/src/screens/clientHome/components/location_slider.dart';

class ClientHomeScreen extends StatefulWidget {
  const ClientHomeScreen({Key? key}) : super(key: key);

  @override
  State<ClientHomeScreen> createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  final ClientHomeController _clientHomeController = Get.put(ClientHomeController());
  @override
  void initState() {
    super.initState();
    _clientHomeController.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldBackColor,
      appBar: CustomAppBar(
        title: 'Müşderiler',
      ),
      body: Column(
        children: [
          LocationSlider(),
          ClientInfoCardSlider(),
        ],
      ),
      bottomSheet: CustomClientBottomSheet(),
    );
  }
}
