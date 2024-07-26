import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kargo_app/src/design/app_colors.dart';
import 'package:kargo_app/src/design/constants.dart';
import 'package:kargo_app/src/screens/clientHome/components/custom_button.dart';
import 'package:kargo_app/src/screens/clientHome/orders_screen.dart';

class ClientIdCard extends StatelessWidget {
  const ClientIdCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.grey5Color),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.greyColor.withOpacity(0.4),
              offset: const Offset(3, 3),
              blurRadius: 20,
            )
          ]),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Batyr Ataşew',
                style: TextStyle(
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
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
            width: Get.width,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: ids.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 3.8),
              itemBuilder: (context, index) => Text('ID:  ${ids[index]}'),
            ),
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
    );
  }
}
