import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kargo_app/src/design/app_colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: 'Gözleg',
        filled: true,
        prefixIcon: SvgPicture.asset(
          'assets/icons/searchnormal1.svg',
          fit: BoxFit.scaleDown,
        ),
        fillColor: AppColors.whiteColor,
        hintStyle: const TextStyle(
          color: AppColors.grey3Color,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
