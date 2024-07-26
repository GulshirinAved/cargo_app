import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kargo_app/src/design/app_colors.dart';
import 'package:kargo_app/src/design/constants.dart';
import 'package:kargo_app/src/screens/clientHome/components/custom_button.dart';
import 'package:kargo_app/src/screens/clientHome/components/numberStepper.dart';

class DeliveryTrackerCard extends StatelessWidget {
  const DeliveryTrackerCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          //id and car number
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
                        )),
                    TextSpan(
                      text: ids[0],
                      style: const TextStyle(
                        fontFamily: 'ALSHauss',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'Maşyn №',
                style: TextStyle(
                  fontFamily: 'ALSHauss',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          //data
          const Text(
            '01.08.2023',
            style: TextStyle(
              color: AppColors.lightBlueColor,
              fontFamily: 'ALSHauss',
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          //transport and location
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Urumçy',
                style: TextStyle(
                  fontFamily: 'ALSHauss',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              IconButton.filled(
                onPressed: () {},
                iconSize: 20,
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(AppColors.grey4Color),
                ),
                icon: SvgPicture.asset('assets/icons/arrow_right.svg'),
              ),
              const Text(
                'Aşgabat',
                style: TextStyle(
                  fontFamily: 'ALSHauss',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          NumberStepper(
            totalSteps: 5,
            width: MediaQuery.of(context).size.width,
            curStep: 3,
            stepCompleteColor: AppColors.blueColor,
            currentStepColor: const Color(0xffdbecff),
            inactiveColor: AppColors.grey3Color,
            lineWidth: 3.5,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Ýer: ',
                      style: TextStyle(
                        fontFamily: 'ALSHauss',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: '1',
                      style: TextStyle(
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
                  Text(
                    'Kub: ',
                    style: TextStyle(
                      fontFamily: 'ALSHauss',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '0.055',
                    style: TextStyle(
                      fontFamily: 'ALSHauss',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'Baha: ',
                    style: TextStyle(
                      fontFamily: 'ALSHauss',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '0.55',
                    style: TextStyle(
                      fontFamily: 'ALSHauss',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/map_pin.svg',
                    color: AppColors.blueColor,
                  ),
                  const Text(
                    'Urumçy',
                    style: TextStyle(
                      color: AppColors.blueColor,
                      fontFamily: 'ALSHauss',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
              const CustomButton()
            ],
          )
        ],
      ),
    );
  }
}
