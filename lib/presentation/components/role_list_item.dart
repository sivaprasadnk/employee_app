import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoleListItem extends StatelessWidget {
  const RoleListItem({
    super.key,
    required this.title,
    required this.callback,
    this.showDivider = true,
  });
  final String title;
  final VoidCallback callback;
  final bool showDivider;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback.call();
      },
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Text(
            title,
            style: TextStyle(fontSize: 16.sp),
          ),
          SizedBox(height: 16.h),
          if (showDivider) Divider(),
        ],
      ),
    );
  }
}
