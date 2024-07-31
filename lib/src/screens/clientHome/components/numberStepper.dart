import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kargo_app/src/design/app_colors.dart';

import 'package:flutter_svg/flutter_svg.dart';

class NumberStepper extends StatelessWidget {
  final double width;
  final int totalSteps;
  final int curStep;
  final Color stepCompleteColor;
  final Color currentStepColor;
  final Color inactiveColor;
  final double lineWidth;

  NumberStepper({
    Key? key,
    required this.width,
    required this.curStep,
    required this.stepCompleteColor,
    required this.totalSteps,
    required this.inactiveColor,
    required this.currentStepColor,
    required this.lineWidth,
  })  : assert(curStep > 0 && curStep <= totalSteps + 1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20.0,
        left: 24.0,
        right: 24.0,
      ),
      width: this.width,
      child: Row(
        children: _steps(),
      ),
    );
  }

  List<Widget> _steps() {
    var list = <Widget>[];
    for (int i = 0; i < totalSteps; i++) {
// Colors according to state
      var circleColor = getCircleColor(i);
      var borderColor = getBorderColor(i);
      var lineColor = getLineColor(i);

// Step circles
      list.add(
        Container(
          width: i + 1 == curStep ? 38.0 : 13.0,
          height: i + 1 == curStep ? 38.0 : 13.0,
          child: getInnerElementOfStepper(i),
          decoration: BoxDecoration(
            color: circleColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: borderColor,
              width: 1.0,
            ),
            boxShadow: i + 1 == curStep
                ? [
                    BoxShadow(
                      color: AppColors.blueColor.withOpacity(0.4),
                    ),
                  ]
                : [],
          ),
        ),
      );

// Line between step circles
      if (i != totalSteps - 1) {
        list.add(
          Expanded(
            child: Container(
              width: lineWidth,
              height: 2,
              color: lineColor,
              margin: EdgeInsets.symmetric(horizontal: 2),
            ),
          ),
        );
      }
    }

    return list;
  }

  Widget getInnerElementOfStepper(int index) {
    if (index + 1 < curStep) {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.blueColor,
          shape: BoxShape.circle,
        ),
      );
    } else if (index + 1 == curStep) {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.blueColor,
          shape: BoxShape.circle,
        ),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(4),
        child: SvgPicture.asset(
          'assets/icons/truck_delivery.svg',
          color: Colors.white,
        ),
      );
    } else {
      return Container();
    }
  }

  Color getCircleColor(int i) {
    if (i + 1 < curStep) {
      return stepCompleteColor;
    } else if (i + 1 == curStep) {
      return currentStepColor;
    } else {
      return inactiveColor;
    }
  }

  Color getBorderColor(int i) {
    if (i + 1 < curStep) {
      return stepCompleteColor;
    } else if (i + 1 == curStep) {
      return currentStepColor;
    } else {
      return inactiveColor;
    }
  }

  Color getLineColor(int i) {
    return curStep > i + 1 ? stepCompleteColor : inactiveColor;
  }
}
