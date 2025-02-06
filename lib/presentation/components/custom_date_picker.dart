import 'package:employee_app/core/constants/colors.dart';
import 'package:employee_app/core/extensions/datetime_extensions.dart';
import 'package:employee_app/presentation/components/cancel_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CustomDatePickerDialog extends StatefulWidget {
  final DateTime initialDate;
  final Function(DateTime) onDateSelected;

  const CustomDatePickerDialog({
    super.key,
    required this.initialDate,
    required this.onDateSelected,
  });

  @override
  State<CustomDatePickerDialog> createState() => _CustomDatePickerDialogState();
}

class _CustomDatePickerDialogState extends State<CustomDatePickerDialog> {
  late DateTime selectedDate;
  late DateTime currentMonth;
  final DateTime today = DateTime.now();

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
    currentMonth =
        DateTime(widget.initialDate.year, widget.initialDate.month, 1);
  }

  void _selectDate(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  void _changeMonth(int increment) {
    setState(() {
      currentMonth =
          DateTime(currentMonth.year, currentMonth.month + increment, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kWhiteColor,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _selectDate(today);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: kCancelBtnColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Text(
                      "Today",
                      style: TextStyle(
                        color: kBtnPrimaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _selectDate(today.nextMonday());
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: kCancelBtnColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Text(
                      "Next Monday",
                      style: TextStyle(
                        color: kBtnPrimaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _selectDate(today.nextTuesday());
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: kCancelBtnColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Text(
                      "Next Tuesday",
                      style: TextStyle(
                        color: kBtnPrimaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _selectDate(today.add(Duration(days: 7)));
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: kCancelBtnColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Text(
                      "After 1 week",
                      style: TextStyle(
                        color: kBtnPrimaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _changeMonth(-1),
                  child: Icon(Icons.arrow_left_rounded),
                ),
                Text(
                  DateFormat.yMMMM().format(currentMonth),
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () => _changeMonth(1),
                  child: Icon(Icons.arrow_right_rounded),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
                  .map((day) => Text(day,
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 15.sp)))
                  .toList(),
            ),
            SizedBox(height: 5),
            _buildCalendarGrid(),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/event.png',
                  height: 24,
                  width: 24,
                ),
                SizedBox(width: 12),
                Text(
                  selectedDate.displayDate(),
                  style: TextStyle(fontSize: 16.sp),
                ),
                Spacer(),
                CancelButton(),
                SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, selectedDate);
                  },
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
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarGrid() {
    final daysInMonth =
        DateUtils.getDaysInMonth(currentMonth.year, currentMonth.month);
    final firstDayOfMonth = DateTime(currentMonth.year, currentMonth.month, 1);
    final startingWeekday =
        firstDayOfMonth.weekday % 7; // Adjust for Sunday start

    List<Widget> dayWidgets = [];
    for (int i = 0; i < startingWeekday; i++) {
      dayWidgets.add(
          SizedBox(width: 30, height: 30)); // Empty spots before the first day
    }

    for (int day = 1; day <= daysInMonth; day++) {
      DateTime date = DateTime(currentMonth.year, currentMonth.month, day);
      bool isToday = today.year == date.year &&
          today.month == date.month &&
          today.day == date.day;

      dayWidgets.add(
        GestureDetector(
          onTap: () => _selectDate(date),
          child: Container(
            // duration: Duration(milliseconds: 100),
            width: 30.w,
            height: 30.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                      ) ==
                      date
                  ? kBlueColor
                  : Colors.transparent,
              shape: BoxShape.circle,
              border: isToday ? Border.all(color: kBlueColor, width: 2) : null,
            ),
            child: Text(
              "$day",
              style: TextStyle(
                fontSize: 15.sp,
                color: DateTime(
                          selectedDate.year,
                          selectedDate.month,
                          selectedDate.day,
                        ) ==
                        date
                    ? kWhiteColor
                    : kBlackColor,
              ),
            ),
          ),
        ),
      );
    }
    debugPrint("selected ::$selectedDate");

    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: dayWidgets,
    );
  }
}
