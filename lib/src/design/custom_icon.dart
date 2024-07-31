import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class CustomIcon extends StatelessWidget {
  String title;
  double height;
  double width;
  Color color;
  CustomIcon({
    required this.title,
    required this.height,
    required this.width,
    required this.color,
    Key? key,
  }) : super(key: key);

  bool mode = false;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      title,
      height: height,
      width: width,
      color: color,
    );
  }
}
