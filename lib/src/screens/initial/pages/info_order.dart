import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kargo_app/src/screens/CustomWidgets/widgets.dart';
import 'package:kargo_app/src/screens/initial/pages/photo_view_page.dart';
import 'package:provider/provider.dart';

import '../../../design/app_colors.dart';
import '../../../design/custom_icon.dart';
import '../providers/orders_byid_provider.dart';
import 'order_image_view.dart';

class InfoOreder extends StatefulWidget {
  final int id;
  const InfoOreder({required this.id, Key? key}) : super(key: key);

  @override
  State<InfoOreder> createState() => _InfoOrederState();
}

class _InfoOrederState extends State<InfoOreder> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  dynamic fetchData() async {
    await Provider.of<GetOrderByIdProvider>(context, listen: false).getOrdersById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final orderById = Provider.of<GetOrderByIdProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            firstPart(orderById, context),
            Container(
              height: 120,
              padding: const EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ListView.builder(
                itemCount: orderById.ordersById!.images.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, i) {
                  return InkWell(
                    onTap: () {
                      Get.to(
                        () => PhotoViewPageMoreImage(
                          images: orderById.ordersById!.images,
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 8,
                        right: 5,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.network(
                            orderById.ordersById!.images[i],
                            fit: BoxFit.cover,
                            loadingBuilder: (
                              BuildContext context,
                              Widget child,
                              ImageChunkEvent? loadingProgress,
                            ) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            lastPart(context, orderById),
          ],
        ),
        bottomNavigationBar: Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: InkWell(
              onTap: () {
                Get.to(() => const OrderImageView());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.mainColor,
                ),
                child: const Text(
                  'Hasap-faktura',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'ALSHauss',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget lastPart(BuildContext context, GetOrderByIdProvider orderById) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 10, bottom: 0),
            child: Text(
              'Harydy yzarlamak',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 490,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: orderById.ordersById!.points.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (con, index) {
                  if (orderById.ordersById!.points[index].isCurrent != 0) {
                    orderById.loc = index;
                  }
                  return Stack(
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                  bottom: 0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      orderById.ordersById!.points[index].date.toString(),
                                      // '12.03.2333',
                                      style: TextStyle(
                                        color: index > orderById.loc ? AppColors.authTextColor : AppColors.mainColor,
                                        fontSize: 14,
                                        fontFamily: 'Montserrat',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        CustomIcon(
                                          title: 'assets/icons/truck_delivery.svg',
                                          height: 24,
                                          width: 24,
                                          color: index > orderById.loc ? AppColors.authTextColor : AppColors.mainColor,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 5,
                                          ),
                                          child: Text(
                                            orderById.ordersById!.points[index].point,
                                            style: TextStyle(
                                              color: index > orderById.loc ? Colors.black : AppColors.mainColor,
                                              fontSize: 16,
                                              fontFamily: 'Montserrat',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 2.5,
                          right: 10,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index < orderById.loc + 1 ? AppColors.mainColor : Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Visibility(
                                visible: index == orderById.ordersById!.points.length - 1 ? false : true,
                                child: Column(
                                  children: List.generate(
                                    5,
                                    (ii) => Padding(
                                      padding: const EdgeInsets.only(
                                        left: 4,
                                        right: 5,
                                        top: 0,
                                        bottom: 3,
                                      ),
                                      child: Container(
                                        height: 6,
                                        width: 3,
                                        color: index < orderById.loc ? AppColors.mainColor : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding firstPart(GetOrderByIdProvider orderById, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'ID: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        orderById.ordersById!.pointTo,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomIcon(
                        title: 'assets/icons/boxh.svg',
                        height: 20,
                        width: 20,
                        color: AppColors.authTextColor,
                      ),
                      const Text(
                        ' Guty: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        orderById.ordersById!.summarySeats.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomIcon(
                        title: 'assets/icons/gps.svg',
                        height: 20,
                        width: 20,
                        color: AppColors.authTextColor,
                      ),
                      const Text(
                        'GPS',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            orderById.ordersById!.date,
                            style: const TextStyle(
                              color: AppColors.authTextColor,
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            orderById.ordersById!.pointFrom,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 170),
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                            color: AppColors.searchColor,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CustomIcon(
                              title: 'assets/icons/arrow_right.svg',
                              height: 20,
                              width: 20,
                              color: AppColors.authTextColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 22,
                      ),
                      SizedBox(
                        width: 80,
                        child: Text(
                          orderById.ordersById!.pointTo,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
              child: SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: orderById.ordersById!.points.length,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (con, index) {
                            if (orderById.ordersById!.points[index].isCurrent != 0) {
                              orderById.loc = index;
                            }
                            // setState(() {
                            //   orderById.loc;
                            // });
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Visibility(
                                  visible: index == 0 ? false : true,
                                  child: Row(
                                    children: [
                                      Row(
                                        children: List.generate(
                                          1,
                                          (ii) => Padding(
                                            padding: const EdgeInsets.only(
                                              left: 3,
                                              right: 3,
                                              top: 7,
                                              bottom: 5,
                                            ),
                                            child: Container(
                                              height: 2.5,
                                              width: 42,
                                              color: index <= orderById.loc ? AppColors.mainColor : Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                index != orderById.loc
                                    ? Container(
                                        height: 12,
                                        width: 12,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: index < orderById.loc ? AppColors.mainColor : Colors.grey,
                                        ),
                                      )
                                    : Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Center(
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.mainColor.withOpacity(
                                                  0.1,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 28,
                                            width: 28,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.mainColor,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: CustomIcon(
                                                title: orderById.loc == 0
                                                    ? 'assets/icons/home.svg'
                                                    : orderById.loc == 5
                                                        ? 'assets/icons/check_circle.svg'
                                                        : 'assets/icons/truck_delivery.svg',
                                                height: 10,
                                                width: 10,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.initialButtonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        top: 10,
                        bottom: 10,
                        right: 12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIcon(
                            title: 'assets/icons/map_pin.svg',
                            height: 18,
                            width: 18,
                            color: AppColors.mainColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            orderById.ordersById!.location,
                            style: const TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
