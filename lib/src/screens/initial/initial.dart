import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kargo_app/src/core/l10n.dart';
import 'package:kargo_app/src/design/constants.dart';
import 'package:kargo_app/src/screens/initial/components/cart_main.dart';
import 'package:kargo_app/src/screens/initial/model/orders_model.dart';
import 'package:kargo_app/src/screens/initial/notifications/notifications.dart';
import 'package:kargo_app/src/screens/initial/pages/search_screen.dart';
import 'package:kargo_app/src/screens/initial/providers/initial_controller.dart';
import 'package:kargo_app/src/screens/initial/providers/orders_provider.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:upgrader/upgrader.dart';

import '../../design/app_colors.dart';
import '../../design/custom_icon.dart';
import '../CustomWidgets/widgets.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    showNotfi();

    fetchData();
    super.initState();
  }

  final InitialPageController initialPageController = Get.put(InitialPageController());

  dynamic fetchData() async {
    await Upgrader.clearSavedSettings();

    initialPageController.showOrders.clear();
    initialPageController.page.value = 1;
    initialPageController.loading.value = 0;
    await OrdersProvider().getOrders(limit: initialPageController.limit.value, page: initialPageController.page.value);
  }

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
    initialPageController.showOrders.clear();

    initialPageController.page.value = 1;
    initialPageController.loading.value = 0;
    await OrdersProvider().getOrders(limit: initialPageController.limit.value, page: initialPageController.page.value);
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.loadComplete();
    initialPageController.page.value += 1;
    await OrdersProvider().getOrders(limit: initialPageController.limit.value, page: initialPageController.page.value);
  }

  dynamic showNotfi() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
          duration: const Duration(seconds: 3),
          padding: const EdgeInsets.all(10),
          elevation: 0,
          content: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Notifications(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.borderColor, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 5),
                      child: Container(
                        color: AppColors.borderColor,
                        height: 60,
                        width: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event.notification?.title ?? '',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'ALSHauss',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            event.notification?.body ?? '',
                            style: const TextStyle(color: Colors.black, fontSize: 14, fontFamily: 'ALSHauss', fontStyle: FontStyle.normal, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrdersProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            searchField(context),
            Expanded(
              child: Obx(
                () {
                  if (initialPageController.loading.value == 0) {
                    return GestureDetector(
                      onTap: () async {
                        await OrdersProvider().getOrders(limit: initialPageController.limit.value, page: initialPageController.page.value);
                      },
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  } else if (initialPageController.loading.value == 1) {
                    return hasError();
                  } else if (initialPageController.loading.value == 2) {
                    return emptyData();
                  } else if (initialPageController.showOrders.isEmpty && initialPageController.loading.value == 3) {
                    return emptyData();
                  }
                  return showPage(context, order);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showPage(BuildContext context, OrdersProvider order) {
    return SmartRefresher(
      footer: footer(),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      enablePullDown: true,
      enablePullUp: true,
      physics: const BouncingScrollPhysics(),
      header: const MaterialClassicHeader(
        color: AppColors.blueColor,
      ),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.zero,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Image.asset(
                'assets/images/anmation.gif',
                fit: BoxFit.fill,
              ),
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            // itemCount: order.orders.length,
            itemCount: initialPageController.showOrders.length,
            itemBuilder: (BuildContext context, int index) {
              final TripModel modelll = TripModel(
                id: int.parse(initialPageController.showOrders[index]['id'].toString()),
                date: initialPageController.showOrders[index]['date'],
                pointFrom: initialPageController.showOrders[index]['point_from'],
                pointTo: initialPageController.showOrders[index]['point_to'],
                trackCode: initialPageController.showOrders[index]['track_code'] ?? '',
                summarySeats: int.parse(initialPageController.showOrders[index]['summary_seats'].toString()),
                ticketCode: initialPageController.showOrders[index]['ticket_code'] ?? '',
                location: initialPageController.showOrders[index]['location'],
                points: initialPageController.showOrders[index]['points'],
              );
              return Padding(
                padding: const EdgeInsets.all(5),
                child: CartMain(
                  model: modelll,
                  // model: order.orders[index],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget searchField(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SearchScreen(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 15),
        decoration: const BoxDecoration(
          color: AppColors.searchColor,
          borderRadius: borderRadius10,
        ),
        child: Row(
          children: [
            CustomIcon(title: 'assets/icons/searchnormal1.svg', height: 25, width: 25, color: AppColors.profilColor),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Text(
                'search'.trs,
                style: const TextStyle(
                  color: AppColors.profilColor,
                  fontSize: 18,
                  fontFamily: 'ALSHauss',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
