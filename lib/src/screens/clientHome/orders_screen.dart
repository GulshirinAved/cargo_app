// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kargo_app/src/design/app_colors.dart';
import 'package:kargo_app/src/screens/CustomWidgets/client_bottomSheet.dart';
import 'package:kargo_app/src/screens/CustomWidgets/custom_appbar.dart';
import 'package:kargo_app/src/screens/clientHome/clientHome_controller.dart';
import 'package:kargo_app/src/screens/clientHome/components/clientId_card.dart';
import 'package:kargo_app/src/screens/clientHome/components/deliveryTracker_card.dart';
import 'package:kargo_app/src/screens/clientHome/data/models/getOneOrder_model.dart';
import 'package:kargo_app/src/screens/clientHome/data/services/getOneOrder_service.dart';

class OrdersScreen extends StatelessWidget {
  final int index;
  const OrdersScreen({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final clientHomeController = Get.find<ClientHomeController>();
    final userId = clientHomeController.userId.value;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackColor,
      appBar: const CustomAppBar(
        title: 'Sargytlar',
      ),
      body: FutureBuilder<List<dynamic>>(
        future: Future.wait([
          GetOneOrderService().fetchOneOrder(userId: userId),
          GetOneOrderService().fetchUserData(userId: userId),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error fetching data: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('No data available'),
            );
          }

          final List<Datum> orders = snapshot.data![0];
          final User user = snapshot.data![1];

          return SingleChildScrollView(
            padding: const EdgeInsets.all(18.0).copyWith(top: 0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: ClientIdCard(user: user, index: index),
                ),
                ListView.builder(
                  itemCount: orders.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => DeliveryTrackerCard(
                    snapshot:
                        AsyncSnapshot.withData(ConnectionState.done, orders),
                    index: index,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomSheet: const CustomClientBottomSheet(),
    );
  }
}
