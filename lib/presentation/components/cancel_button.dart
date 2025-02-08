import 'package:employee_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 40.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: kCancelBtnColor,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Center(
          child: Text(
            'Cancel',
            style: TextStyle(
              fontSize: 8.sp,
              color: kBlueColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
