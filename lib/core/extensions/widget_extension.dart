import 'package:employee_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget get addBorder => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: kBlueColor,
          ),
        ),
        child: this,
      );
}
