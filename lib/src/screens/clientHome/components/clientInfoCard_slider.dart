import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kargo_app/src/design/app_colors.dart';
import 'package:kargo_app/src/screens/clientHome/components/custom_button.dart';
import 'package:kargo_app/src/screens/clientHome/orders_screen.dart';

class ClientInfoCardSlider extends StatelessWidget {
  const ClientInfoCardSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(bottom: 70),
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Batyr Ataşew',
                        style: TextStyle(
                          color: AppColors.mainTextColor,
                          fontFamily: 'ALSHauss',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '1050 TMT',
                        style: TextStyle(
                          color: AppColors.redColor,
                          fontFamily: 'ALSHauss',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        onTap: () => Get.to(() => const OrdersScreen()),
                      ),
                      const CustomButton(
                        withIcon: true,
                        backColor: AppColors.lightBlue1Color,
                        textColor: AppColors.blueColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) => const Divider(
              color: AppColors.grey2Color,
            ),
            itemCount: 15,
          ),
        ),
      ),
    );
  }
}
