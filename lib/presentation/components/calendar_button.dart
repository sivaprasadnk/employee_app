import 'package:employee_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CalendarButton extends StatelessWidget {
  const CalendarButton({
    super.key,
    required this.callback,
    required this.title,
    required this.isSelected,
  });
  final VoidCallback callback;
  final String title;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callback.call();
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: isSelected ? kBtnPrimaryColor : kCancelBtnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? kWhiteColor : kBtnPrimaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }
}
