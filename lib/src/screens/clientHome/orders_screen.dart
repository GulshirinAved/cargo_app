// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:kargo_app/src/design/app_colors.dart';
import 'package:kargo_app/src/screens/clientHome/clientHome_controller.dart';
import 'package:kargo_app/src/screens/clientHome/components/clientId_card.dart';
import 'package:kargo_app/src/screens/clientHome/components/deliveryTracker_card.dart';
import 'package:kargo_app/src/screens/clientHome/data/models/getOneOrder_model.dart';
import 'package:kargo_app/src/screens/clientHome/data/services/getOneOrder_service.dart';
import 'package:kargo_app/src/screens/clientHome/tolegler_page.dart';
import 'package:kargo_app/src/screens/custom_widgets/custom_appbar.dart';
import 'package:kargo_app/src/screens/custom_widgets/widgets.dart';

class OrdersScreen extends StatefulWidget {
  final int index;
  const OrdersScreen({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final ClientHomeController clientHomeController = Get.put(ClientHomeController());
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final userId = clientHomeController.userId.value;

    return Scaffold(
      backgroundColor: AppColors.searchColor,
      appBar: CustomAppBar(
        title: selectedIndex == 0 ? 'Sargytlar' : 'Tölegler',
        backButton: true,
      ),
      bottomSheet: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 26,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.mainColor,
        useLegacyColorScheme: true,
        selectedLabelStyle: const TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold, fontSize: 13),
        unselectedLabelStyle: const TextStyle(fontFamily: 'Roboto', fontSize: 12),
        currentIndex: selectedIndex,
        onTap: (index) async {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Müşderiler',
            icon: Icon(
              IconlyLight.user,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Tölegler',
            icon: Icon(
              IconlyLight.document,
            ),
          ),
        ],
      ),
      body: page1(userId),
    );
  }

  FutureBuilder<List<dynamic>> page1(String userId) {
    return FutureBuilder<List<dynamic>>(
      future: Future.wait([
        GetOneOrderService().fetchOneOrder(userId: userId, ticketID: ''),
        GetOneOrderService().fetchUserData(userId: userId),
      ]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loading();
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error fetching data: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: Text('No data available'),
          );
        }
        final List<Datum> list = snapshot.data![0];

        clientHomeController.showOrderIDList.addAll(list);
        final User user = snapshot.data![1];

        return selectedIndex == 0
            ? pagee(user)
            : Tolegler(
                totalDebt: user.totalDebt!,
              );
      },
    );
  }

  ListView pagee(User user) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(18.0).copyWith(top: 0),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ClientIdCard(user: user, index: widget.index),
        ),
        Obx(() {
          return clientHomeController.showOrderIDList.isEmpty
              ? emptyDataMine()
              : ListView.builder(
                  itemCount: clientHomeController.showOrderIDList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => DeliveryTrackerCard(
                    snapshot: AsyncSnapshot.withData(ConnectionState.done, clientHomeController.showOrderIDList),
                    index: index,
                  ),
                );
        }),
      ],
    );
  }
}
