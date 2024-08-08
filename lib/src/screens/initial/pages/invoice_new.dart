import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kargo_app/src/design/app_colors.dart';
import 'package:kargo_app/src/screens/initial/providers/invoice_providers.dart';
import 'package:provider/provider.dart';
import 'package:zoom_widget/zoom_widget.dart';

import '../../../design/custom_icon.dart';
import '../../custom_widgets/widgets.dart';

// ignore: must_be_immutable
class InvoiceNew extends StatefulWidget {
  int id;
  InvoiceNew({required this.id, super.key});

  @override
  State<InvoiceNew> createState() => _InvoiceNewState();
}

class _InvoiceNewState extends State<InvoiceNew> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  dynamic fetchData() async {
    await Provider.of<InvoiceProvider>(context, listen: false).getInvoice(context, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final invoice = Provider.of<InvoiceProvider>(context);
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 70,
            elevation: 0,
            centerTitle: true,
            iconTheme: const IconThemeData(color: AppColors.profilColor, size: 30),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),
            title: Text(
              'order_info'.tr(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: invoice.invoice != null
            ? Consumer<InvoiceProvider>(
                builder: (_, invoicess, __) {
                  if (invoicess.isLoading == false) {
                    return SizedBox(
                      child: Zoom(
                        initTotalZoomOut: true,
                        maxZoomWidth: 1640,
                        maxZoomHeight: 3000,
                        backgroundColor: Colors.white,
                        colorScrollBars: Colors.grey,
                        opacityScrollBars: 0.3,
                        scrollWeight: 5.0,
                        // centerOnScale: true,
                        enableScroll: true,
                        doubleTapZoom: true,
                        zoomSensibility: 0.05,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 100,
                            right: 100,
                            top: 0,
                            bottom: 60,
                          ),
                          child: SizedBox(
                            // width: MediaQuery.of,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 200,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 60),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/logo.png',
                                              height: 300,
                                              width: 450,
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            Row(
                                              children: [
                                                CustomIcon(
                                                  title: 'assets/icons/phone.svg',
                                                  height: 24,
                                                  width: 24,
                                                  color: AppColors.profilColor,
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    '+99361 00 00 66 Batyr',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 24,
                                                      fontFamily: 'Roboto',
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 15,
                                              ),
                                              child: Row(
                                                children: [
                                                  CustomIcon(
                                                    title: 'assets/icons/phone.svg',
                                                    height: 24,
                                                    width: 24,
                                                    color: AppColors.profilColor,
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 10,
                                                    ),
                                                    child: Text(
                                                      '+99365 67 77 67 Kakajan',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 24,
                                                        fontFamily: 'Roboto',
                                                        fontStyle: FontStyle.normal,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 15,
                                              ),
                                              child: Row(
                                                children: [
                                                  CustomIcon(
                                                    title: 'assets/icons/phone.svg',
                                                    height: 24,
                                                    width: 24,
                                                    color: AppColors.profilColor,
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 10,
                                                    ),
                                                    child: Text(
                                                      '+99365 49 94 46 Berdi',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 24,
                                                        fontFamily: 'Roboto',
                                                        fontStyle: FontStyle.normal,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(right: 60),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                'Urumçi-Türkmenistan \n 新疆乌鲁木齐市天山区延安路边疆宾馆106库房 \n 收货人：吴慧 +8618699106778 Наташа Урумчи',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                  fontFamily: 'Roboto',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 60,
                                            ),
                                            SizedBox(
                                              // width: 480,
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                'Guanjou-Urumçi-Türkmenistan \n +8618699106778 广州市 白云区 石井镇 \n 鸦岗大道 安发货运市场 A9栋69-70号 鑫唯达物流 \n 收货人: 吴劲松 +8613352898456 Гуанчжоу',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                  fontFamily: 'Roboto',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40),
                                    child: Container(
                                      height: 1.5,
                                      color: Colors.black,
                                      // width: MediaQuery.of(context).size.width,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          invoice.invoice?.date ?? '',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 24,
                                            fontFamily: 'Roboto',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          invoice.invoice?.ticketId ?? '',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 24,
                                            fontFamily: 'Roboto',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          invoice.invoice?.pointFrom ?? '',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 24,
                                            fontFamily: 'Roboto',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          invoice.invoice?.pointTo ?? '',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 24,
                                            fontFamily: 'Roboto',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 1.5,
                                    color: Colors.black,
                                    // width: MediaQuery.of(context).size.width,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 12,
                                      bottom: 12,
                                      right: 9,
                                      left: 8,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          // width: deviceWidth / ,
                                          child: Builder(
                                            builder: (context) {
                                              final tripData = invoice.invoice;
                                              if (tripData != null) {
                                                final trNumber = tripData.transport_number;
                                                // tr_number = tr_number.replaceAll(
                                                //     '', '\u200B');
                                                return Text(
                                                  'transport_number'.tr() + trNumber,
                                                  // overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 24,
                                                    fontFamily: 'Roboto',
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                );
                                              } else {
                                                return const Text('');
                                              }
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: deviceWidth / 2 - 50,
                                          child: Text(
                                            invoice.invoice?.trackCode ?? '',
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontFamily: 'Roboto',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          invoice.invoice?.customersName ?? '',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 24,
                                            fontFamily: 'Roboto',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          '+993${invoice.invoice?.customersPhone}',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 24,
                                            fontFamily: 'Roboto',
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 1.5,
                                    color: Colors.black,
                                    // width: MediaQuery.of(context).size.width,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 12,
                                      bottom: 12,
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: deviceWidth / 2 - 15,
                                          child: Text(
                                            'name_product'.tr(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: deviceWidth / 17,
                                              fontFamily: 'Roboto',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 80),
                                          child: SizedBox(
                                            width: deviceWidth / 3 + 10,
                                            child: Text(
                                              'type_of_box'.tr(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: deviceWidth / 17,
                                                fontFamily: 'Roboto',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: deviceWidth / 2,
                                          ),
                                          child: Center(
                                            child: SizedBox(
                                              child: Text(
                                                'scale'.tr(),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: deviceWidth / 17,
                                                  fontFamily: 'Roboto',
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: deviceWidth / 2 - 20,
                                          ),
                                          child: SizedBox(
                                            width: deviceWidth + 124,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: deviceWidth / 4,
                                                  child: Text(
                                                    'land_number'.tr(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: deviceWidth / 17,
                                                      fontFamily: 'Roboto',
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: deviceWidth / 4 - 45,
                                                  child: Text(
                                                    'cub_in'.tr(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: deviceWidth / 17,
                                                      fontFamily: 'Roboto',
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: deviceWidth / 4 - 40,
                                                  child: Text(
                                                    'kg'.tr(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: deviceWidth / 17,
                                                      fontFamily: 'Roboto',
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: deviceWidth / 4 - 15,
                                                  child: Text(
                                                    textAlign: TextAlign.end,
                                                    'cost_in'.tr(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: deviceWidth / 17,
                                                      fontFamily: 'Roboto',
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemCount: invoice.invoice!.cargoItems.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      final packingSizeLast = invoice.invoice!.cargoItems[index].packingSizeLast;
                                      final packingSizeMiddle = invoice.invoice?.cargoItems[index].packingSizeMiddle;

                                      final packingSizeFirst = invoice.invoice?.cargoItems[index].packingSizeFirst;
                                      // final String cargoItems1 = packingSizeFirst.toStringAsFixed(3);
                                      // final String cargoItems2 = packingSizeMiddle.toStringAsFixed(3);
                                      // final String cargoItems3 = packingSizeLast.toStringAsFixed(3);
                                      final String cargoItems1 = packingSizeFirst;
                                      final String cargoItems2 = packingSizeMiddle;
                                      final String cargoItems3 = packingSizeLast;

                                      return Column(
                                        children: [
                                          Container(
                                            height: 1.5,
                                            color: Colors.black,
                                            // width: MediaQuery.of(context).size.width,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                              top: 12,
                                              right: 10,
                                              bottom: 12,
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Builder(
                                                  builder: (context) {
                                                    var name = invoice.invoice?.cargoItems[index].packingSizeLast.toString();
                                                    name = name!.replaceAll(
                                                      '',
                                                      '\u200B',
                                                    );

                                                    return SizedBox(
                                                      width: deviceWidth / 2 + 5,
                                                      child: Text(
                                                        invoice.invoice?.cargoItems[index].productName ?? '',
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: deviceWidth / 17,
                                                          fontFamily: 'Roboto',
                                                          fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: deviceWidth / 4 - 40,
                                                  ),
                                                  child: SizedBox(
                                                    width: deviceWidth / 2 - 5,
                                                    child: Text(
                                                      invoice.invoice?.cargoItems[index].typePackagingId ?? '',
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: deviceWidth / 17,
                                                        fontFamily: 'Roboto',
                                                        fontStyle: FontStyle.normal,
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: deviceWidth / 11 - 30,
                                                ),
                                                SizedBox(
                                                  width: deviceWidth / 4 + 5,
                                                  child: Text(
                                                    // invoice
                                                    //         .invoice
                                                    //         ?.cargoItems[
                                                    //             index]
                                                    //         .packingSizeFirst
                                                    //         .toString() ??
                                                    //     "",
                                                    cargoItems1,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: deviceWidth / 17,
                                                      fontFamily: 'Roboto',
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: deviceWidth / 4 + 5,
                                                  child: Text(
                                                    // invoice
                                                    //         .invoice
                                                    //         ?.cargoItems[
                                                    //             index]
                                                    //         .packingSizeMiddle
                                                    //         .toString() ??
                                                    //     "",
                                                    cargoItems2,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: deviceWidth / 17,
                                                      fontFamily: 'Roboto',
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: deviceWidth / 4 + 5,
                                                  child: Text(
                                                    // invoice
                                                    //         .invoice
                                                    //         ?.cargoItems[
                                                    //             index]
                                                    //         .packingSizeLast
                                                    //         .toString() ??
                                                    //     "",
                                                    cargoItems3,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: deviceWidth / 17,
                                                      fontFamily: 'Roboto',
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: deviceWidth / 8 - 5,
                                                  ),
                                                  child: SizedBox(
                                                    width: deviceWidth + 105,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width: deviceWidth / 12,
                                                          child: Text(
                                                            textAlign: TextAlign.center,
                                                            invoice.invoice?.cargoItems[index].numberOfSeats.toString() ?? '',
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: deviceWidth / 17,
                                                              fontFamily: 'Roboto',
                                                              fontStyle: FontStyle.normal,
                                                              fontWeight: FontWeight.w700,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                            left: deviceWidth / 5 - 20,
                                                          ),
                                                          child: SizedBox(
                                                            width: deviceWidth / 6,
                                                            child: Text(
                                                              textAlign: TextAlign.center,
                                                              invoice.invoice?.cargoItems[index].cube.toString() ?? '',
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: deviceWidth / 17,
                                                                fontFamily: 'Roboto',
                                                                fontStyle: FontStyle.normal,
                                                                fontWeight: FontWeight.w700,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                            left: deviceWidth / 10 - 20,
                                                          ),
                                                          child: SizedBox(
                                                            width: deviceWidth / 5,
                                                            child: Text(
                                                              invoice.invoice?.cargoItems[index].kg.toString() ?? '',
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: deviceWidth / 17,
                                                                fontFamily: 'Roboto',
                                                                fontStyle: FontStyle.normal,
                                                                fontWeight: FontWeight.w700,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: deviceWidth / 5 + 5,
                                                          child: Text(
                                                            textAlign: TextAlign.end,
                                                            invoice.invoice?.cargoItems[index].totalPrice.toString() ?? '',
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: deviceWidth / 17,
                                                              fontFamily: 'Roboto',
                                                              fontStyle: FontStyle.normal,
                                                              fontWeight: FontWeight.w700,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // Container(
                                          //   height: 1.5,
                                          //   color: Colors.black,
                                          //   // width: MediaQuery.of(context).size.width,
                                          // ),
                                        ],
                                      );
                                    },
                                  ),
                                  Container(
                                    height: 1.5,
                                    color: Colors.black,
                                    // width: MediaQuery.of(context).size.width,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: invoice.invoice!.expenses.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              invoice.invoice?.expenses[index].name.toString() ?? '',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 24,
                                                fontFamily: 'Roboto',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            invoice.invoice?.expenses[index].price != null
                                                ? Text(
                                                    invoice.invoice?.expenses[index].price.toString() ?? '',
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 24,
                                                      fontFamily: 'Roboto',
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  )
                                                : const Text(''),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 1.5,
                                    color: Colors.black,
                                    // width: MediaQuery.of(context).size.width,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 15,
                                      right: 8,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'all_land'.tr(),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 24,
                                                fontFamily: 'Roboto',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              invoice.invoice?.summarySeats.toString() ?? '',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 24,
                                                fontFamily: 'Roboto',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'sum_cub'.tr(),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 24,
                                                fontFamily: 'Roboto',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              invoice.invoice?.summaryCube.toString() ?? '',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 24,
                                                fontFamily: 'Roboto',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'sum_kg'.tr(),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 24,
                                                fontFamily: 'Roboto',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              invoice.invoice?.summaryKg.toString() ?? '',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 24,
                                                fontFamily: 'Roboto',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'sum_cost'.tr(),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 24,
                                                fontFamily: 'Roboto',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              invoice.invoice?.summaryPrice.toString() ?? '',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 24,
                                                fontFamily: 'Roboto',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 200,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return loading();
                  }
                },
              )
            : loading(),
      ),
    );
  }
}
