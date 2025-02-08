import 'package:employee_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.callback,
  });
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback.call();
      },
      child: Container(
        width: 40.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: kBlueColor,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Center(
          child: Text(
            'Save',
            style: TextStyle(
              fontSize: 8.sp,
              // fontSize: 20,
              color: kWhiteColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
