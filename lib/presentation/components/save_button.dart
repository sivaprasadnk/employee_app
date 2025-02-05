import 'package:employee_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 73.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: kBlueColor,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Center(
          child: Text(
            'Save',
            style: TextStyle(
              fontSize: 14.sp,
              color: kWhiteColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
