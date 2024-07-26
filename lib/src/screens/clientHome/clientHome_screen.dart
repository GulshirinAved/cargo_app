import 'package:flutter/material.dart';
import 'package:kargo_app/src/design/app_colors.dart';
import 'package:kargo_app/src/screens/CustomWidgets/client_bottomSheet.dart';
import 'package:kargo_app/src/screens/CustomWidgets/custom_appbar.dart';
import 'package:kargo_app/src/screens/clientHome/components/clientInfoCard_slider.dart';
import 'package:kargo_app/src/screens/clientHome/components/location_slider.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldBackColor,
      appBar: CustomAppBar(
        title: 'Müşderiler',
      ),
      body: Column(
        children: [
          //location slider
          LocationSlider(),
          //user name card
          ClientInfoCardSlider(),
        ],
      ),
      bottomSheet: CustomClientBottomSheet(),
    );
  }
}
