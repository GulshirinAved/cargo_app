import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kargo_app/src/design/app_colors.dart';

class CustomButton extends StatelessWidget {
  final bool? withIcon;
  final Color? backColor;
  final Color? textColor;
  final VoidCallback? onTap;
  const CustomButton({
    Key? key,
    this.withIcon = false,
    this.backColor,
    this.textColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: backColor ?? AppColors.blueColor,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: withIcon == true
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3, right: 5),
                    child: SvgPicture.asset(
                      'assets/icons/phone.svg',
                      color: textColor,
                      height: 16,
                    ),
                  ),
                  Text(
                    'Jaň et',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontFamily: 'ALSHauss',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            : const Text(
                'Doly maglumat',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontFamily: 'ALSHauss',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }
}
