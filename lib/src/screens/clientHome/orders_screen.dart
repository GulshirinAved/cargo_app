import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kargo_app/src/design/app_colors.dart';
import 'package:kargo_app/src/screens/CustomWidgets/client_bottomSheet.dart';
import 'package:kargo_app/src/screens/CustomWidgets/custom_appbar.dart';
import 'package:kargo_app/src/screens/clientHome/components/clientId_card.dart';
import 'package:kargo_app/src/screens/clientHome/components/deliveryTracker_card.dart';
import 'package:kargo_app/src/screens/clientHome/components/search_textfield.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackColor,
      appBar: const CustomAppBar(
        title: 'Sargytlar',
      ),
      body: Column(
        children: [
// Search field
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            width: Get.width,
            child: const SearchTextField(),
          ),
// Scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18.0).copyWith(top: 0),
              child: Column(
                children: [
// Client ID card
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: ClientIdCard(),
                  ),
// DeliveryTracker cards
                  ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        const DeliveryTrackerCard(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: const CustomClientBottomSheet(),
    );
  }
}
