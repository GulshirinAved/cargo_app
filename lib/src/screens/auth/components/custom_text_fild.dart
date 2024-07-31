import 'package:flutter/material.dart';

import '../../../design/app_colors.dart';

class CustomTextFild extends StatelessWidget {
  String hint;
  TextEditingController controller;
  CustomTextFild({Key? key, required this.hint, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.textFildColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Center(
          child: TextFormField(
            controller: controller,
            maxLines: 1,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: hint,
                hintStyle: const TextStyle(
                    color: AppColors.authTextColor,
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400)),
          ),
        ),
      ),
    );
  }
}
