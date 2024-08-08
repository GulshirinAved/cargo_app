import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../design/app_colors.dart';
import '../../../design/custom_icon.dart';
import '../model/orders_model.dart';
import '../pages/info_order.dart';

class CartMain extends StatefulWidget {
  final TripModel model;

  const CartMain({required this.model, super.key});

  @override
  State<CartMain> createState() => _CartMainState();
}

class _CartMainState extends State<CartMain> {
  @override
  Widget build(BuildContext context) {
    int t = 0;
    final int l = widget.model.points!.length;
    if (widget.model.points != null) {
      for (var i = 0; i < widget.model.points!.length; i++) {
        if (widget.model.points?[i].isCurrent != 0) {
          t = i;
        }
      }
    }

    var name = widget.model.ticketCode;
    var trNumber2 = widget.model.transportNumber;
    name = name.replaceAll('', '\u200B');
    trNumber2 = trNumber2.replaceAll('', '\u200B');

    final double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      // height: MediaQuery.of(context).size.height / 4 - 11,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 25,
              right: MediaQuery.of(context).size.width / 25,
              top: MediaQuery.of(context).size.width / 30 - 6,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 40,
                  child: Row(
                    children: [
                      Text(
                        'id'.tr(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width / 26,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 70,
                        child: Text(
                          name,

                          // maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width / 29,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Text(
                      //   'transport_number'.tr(),
                      //   // 'Maşyn №: ',
                      //   style: TextStyle(
                      //       color: Colors.black,
                      //       fontSize: MediaQuery.of(context).size.width / 26,
                      //       fontFamily: 'Roboto',
                      //       fontStyle: FontStyle.normal,
                      //       fontWeight: FontWeight.w400),
                      // ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 10,
                        child: Text(
                          'transport_number'.tr() + trNumber2,
                          // maxLines: 2,
                          softWrap: false,
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width / 29,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      // CustomIcon(
                      //     title: 'assets/icons/gps.svg',
                      //     height: 20,
                      //     width: 20,
                      //     color: AppColors.authTextColor),
                      // const SizedBox(
                      //   width: 3,
                      // ),
                      // Text(
                      //   'gps'.tr(),
                      //   style: const TextStyle(
                      //       color: Colors.black,
                      //       fontSize: 16,
                      //       fontFamily: 'Roboto',
                      //       fontStyle: FontStyle.normal,
                      //       fontWeight: FontWeight.w400),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: deviceWidth / 26 - 1,
              right: deviceWidth / 26 - 1,
              top: deviceWidth / 250,
            ),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.model.date,
                              style: TextStyle(
                                color: AppColors.authTextColor,
                                fontSize: MediaQuery.of(context).size.width / 29,
                                fontFamily: 'Roboto',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: deviceWidth / 5.9,
                              child: Text(
                                widget.model.pointFrom,
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.width / 26,
                                  fontFamily: 'Roboto',
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 2 - 40,
                              ),
                              child: Center(
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    color: AppColors.mainColor.withOpacity(0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: CustomIcon(
                                      title: 'assets/icons/arrow_right.svg',
                                      height: 20,
                                      width: 20,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: deviceWidth / 22,
                        ),
                        SizedBox(
                          width: 80,
                          child: Text(
                            widget.model.pointTo,
                            textAlign: TextAlign.right,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.width / 26,
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
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: deviceWidth / 26 - 1,
              right: deviceWidth / 26 - 1,
              top: 0,
              bottom: 0,
            ),
            child: widget.model.points!.isNotEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.width / 10,
                    // width: MediaQuery.of(context).size.width - 40,
                    child: Center(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.model.points?.length,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (con, index) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Visibility(
                                visible: index == 0 ? false : true,
                                child: FittedBox(
                                  child: Row(
                                    children: List.generate(
                                      1,
                                      (ii) => Padding(
                                        padding: EdgeInsets.only(
                                          left: deviceWidth / 120,
                                          right: deviceWidth / 120,
                                          top: deviceWidth / 80,
                                          bottom: deviceWidth / 100,
                                        ),
                                        child: Container(
                                          height: 2.5,
                                          width: MediaQuery.of(context).size.width / 9,
                                          color: index <= t && t >= 0 ? AppColors.mainColor : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              index != t
                                  ? Container(
                                      height: deviceWidth / 38,
                                      width: deviceWidth / 38,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: index <= t && t >= 0 ? AppColors.mainColor : Colors.grey,
                                      ),
                                    )
                                  : Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Center(
                                          child: Container(
                                            height: deviceWidth / 11,
                                            width: deviceWidth / 11,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.mainColor.withOpacity(0.1),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: deviceWidth / 14.5,
                                          width: deviceWidth / 14.5,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.mainColor,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                              4.0,
                                            ),
                                            child: CustomIcon(
                                              title: t == 0
                                                  ? 'assets/icons/home.svg'
                                                  : t == l - 1
                                                      ? 'assets/icons/check_circle.svg'
                                                      : 'assets/icons/truck_delivery.svg',
                                              height: deviceWidth / 40,
                                              width: deviceWidth / 40,
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
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.width / 10,
                    // width: MediaQuery.of(context).size.width - 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 6,
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (con, index) {
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Visibility(
                                      visible: index == 0 ? false : true,
                                      child: Row(
                                        children: [
                                          FittedBox(
                                            child: Row(
                                              children: List.generate(
                                                1,
                                                (ii) => Padding(
                                                  padding: EdgeInsets.only(
                                                    left: deviceWidth / 120,
                                                    right: deviceWidth / 120,
                                                    top: deviceWidth / 80,
                                                    bottom: deviceWidth / 100,
                                                  ),
                                                  child: Container(
                                                    height: 2.5,
                                                    width: MediaQuery.of(
                                                          context,
                                                        ).size.width /
                                                        9,
                                                    color: index <= t && t >= 0 ? AppColors.mainColor : Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    index != t
                                        ? Container(
                                            height: deviceWidth / 38,
                                            width: deviceWidth / 38,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: index <= t && t >= 0 ? AppColors.mainColor : Colors.grey,
                                            ),
                                          )
                                        : Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Center(
                                                child: Container(
                                                  height: deviceWidth / 11,
                                                  width: deviceWidth / 11,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: AppColors.mainColor.withOpacity(
                                                      0.1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: deviceWidth / 14.5,
                                                width: deviceWidth / 14.5,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColors.mainColor,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    5.0,
                                                  ),
                                                  child: CustomIcon(
                                                    title: t == 0
                                                        ? 'assets/icons/home.svg'
                                                        : t == l - 1
                                                            ? 'assets/icons/check_circle.svg'
                                                            : 'assets/icons/truck_delivery.svg',
                                                    height: deviceWidth / 40,
                                                    width: deviceWidth / 40,
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
            padding: EdgeInsets.only(
              left: deviceWidth / 26 - 1,
              right: deviceWidth / 26 - 1,
              top: 2,
              bottom: deviceWidth / 200 - 1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  // width: MediaQuery.of(context).size.width / 4 - 30,
                  child: Row(
                    children: [
                      // CustomIcon(
                      //     title: 'assets/icons/boxh.svg',
                      //     height: 20,
                      //     width: 20,
                      //     color: Colors.black),
                      Text(
                        'place'.tr(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width / 26,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: SizedBox(
                          // width: MediaQuery.of(context).size.width / 4 - 25,
                          child: Text(
                            widget.model.summarySeats.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.width / 26,
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width / 4 - 25,
                //   child: Row(
                //     children: [
                //       SizedBox(
                //           height: 24,
                //           width: 25,
                //           child: Image.asset('assets/images/kg.png')),
                //       Padding(
                //         padding: const EdgeInsets.only(left: 5),
                //         child: Text(
                //           widget.model.summaryKg.toString(),
                //           style: const TextStyle(
                //               color: Colors.black,
                //               fontSize: 16,
                //               fontFamily: 'Roboto',
                //               fontStyle: FontStyle.normal,
                //               fontWeight: FontWeight.w400),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  // width: MediaQuery.of(context).size.width / 4,
                  child: Row(
                    children: [
                      // SizedBox(
                      //     height: 22,
                      //     width: 22,
                      //     child: Image.asset('assets/images/cube_new.png')),
                      Text(
                        'cub'.tr(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width / 26,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          widget.model.summaryCube.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width / 26,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  // width: MediaQuery.of(context).size.width / 4,
                  child: Row(
                    children: [
                      // const Icon(Icons.attach_money, ),
                      Text(
                        'cost'.tr(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width / 26,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        widget.model.summaryPrice.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width / 26,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: deviceWidth / 26 - 1,
              right: deviceWidth / 26 - 1,
              bottom: deviceWidth / 100,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    // width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      widget.model.danhaoCode.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.width / 26,
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  // width: MediaQuery.of(context).size.width / 2.5,
                  child: Text(
                    widget.model.trackCode.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width / 26,
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
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 50,
              right: MediaQuery.of(context).size.width / 50,
              top: 0,
              bottom: MediaQuery.of(context).size.width / 55,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    // color: AppColors.initialButtonColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 65,
                      top: MediaQuery.of(context).size.width / 60,
                      bottom: MediaQuery.of(context).size.width / 60,
                      right: MediaQuery.of(context).size.width / 60,
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
                          widget.model.location,
                          style: TextStyle(
                            color: AppColors.mainColor,
                            fontSize: MediaQuery.of(context).size.width / 32,
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => InfoOreder(
                          id: widget.model.id,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 55,
                        right: MediaQuery.of(context).size.width / 55,
                        bottom: MediaQuery.of(context).size.width / 55,
                        top: MediaQuery.of(context).size.width / 55,
                      ),
                      child: Text(
                        'more_info'.tr(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width / 33,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
