import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:kargo_app/src/design/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? backButton;
  const CustomAppBar({
    required this.title,
    Key? key,
    this.backButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      scrolledUnderElevation: 0.0,
      toolbarHeight: 70,
      leading: backButton == false || backButton == null
          ? const SizedBox.shrink()
          : IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                IconlyLight.arrow_left_circle,
                color: Colors.black,
              ),
            ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'ALSHauss',
          color: AppColors.blackColor,
          fontWeight: FontWeight.w500,
          fontSize: 28,
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: AppColors.greyColor.withOpacity(0.4),
              offset: const Offset(3, 3),
            ),
          ],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
