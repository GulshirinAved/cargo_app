// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:kargo_app/src/design/app_colors.dart';
import 'package:kargo_app/src/screens/clientHome/components/custom_button.dart';
import 'package:kargo_app/src/screens/clientHome/components/numberStepper.dart';
import 'package:kargo_app/src/screens/clientHome/data/models/getOneOrder_model.dart';

class DeliveryTrackerCard extends StatelessWidget {
  final AsyncSnapshot<List<Datum>> snapshot;
  final int index;
  const DeliveryTrackerCard({
    required this.snapshot,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int currentStepIndex = snapshot.data![index].points!
        .indexWhere((point) => point.isCurrent == 1);
    final int curStep = (currentStepIndex == -1 ? 1 : currentStepIndex + 1)
        .clamp(1, snapshot.data![index].points!.length + 1);

    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(20).copyWith(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.grey5Color),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyColor.withOpacity(0.4),
            offset: const Offset(3, 3),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ID and car number
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'ID: ',
                      style: TextStyle(
                        fontFamily: 'ALSHauss',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: snapshot.data![index].id.toString(),
                      style: const TextStyle(
                        fontFamily: 'ALSHauss',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Maşyn №',
                      style: TextStyle(
                        fontFamily: 'ALSHauss',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: snapshot.data![index].transportNumber ?? '',
                      style: const TextStyle(
                        fontFamily: 'ALSHauss',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Date
          Text(
            snapshot.data![index].date ?? '',
            style: const TextStyle(
              color: AppColors.lightBlueColor,
              fontFamily: 'ALSHauss',
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          // Transport and location
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                snapshot.data![index].pointFrom ?? '',
                style: const TextStyle(
                  fontFamily: 'ALSHauss',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              IconButton(
                onPressed: () {},
                iconSize: 20,
                style: const ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(AppColors.grey4Color),
                ),
                icon: SvgPicture.asset('assets/icons/arrow_right.svg'),
              ),
              Text(
                snapshot.data![index].pointTo ?? '',
                style: const TextStyle(
                  fontFamily: 'ALSHauss',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          // Number stepper
          NumberStepper(
            totalSteps: snapshot.data![index].points!.length,
            width: MediaQuery.of(context).size.width,
            curStep: curStep,
            stepCompleteColor: AppColors.blueColor,
            currentStepColor: const Color(0xffdbecff),
            inactiveColor: AppColors.grey3Color,
            lineWidth: 3.5,
          ),
          // Summary details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Ýer: ',
                      style: TextStyle(
                        fontFamily: 'ALSHauss',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: snapshot.data![index].summarySeats.toString(),
                      style: const TextStyle(
                        fontFamily: 'ALSHauss',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Text(
                    'Kub: ',
                    style: TextStyle(
                      fontFamily: 'ALSHauss',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    snapshot.data![index].summaryCube.toString(),
                    style: const TextStyle(
                      fontFamily: 'ALSHauss',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Baha: ',
                    style: TextStyle(
                      fontFamily: 'ALSHauss',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    snapshot.data![index].summaryPaid.toString(),
                    style: const TextStyle(
                      fontFamily: 'ALSHauss',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Current location and custom button
          if (currentStepIndex != -1)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/map_pin.svg',
                      color: AppColors.blueColor,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text(
                        snapshot.data![index].points![currentStepIndex].point
                            .toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.blueColor,
                          fontFamily: 'ALSHauss',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const CustomButton(),
              ],
            ),
        ],
      ),
    );
  }
}
