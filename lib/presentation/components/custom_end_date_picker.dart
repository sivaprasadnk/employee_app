import 'package:employee_app/core/constants/colors.dart';
import 'package:employee_app/core/extensions/datetime_extensions.dart';
import 'package:employee_app/presentation/components/calendar_button.dart';
import 'package:employee_app/presentation/components/cancel_button.dart';
import 'package:employee_app/presentation/components/save_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class CustomEndDatePickerDialog extends StatefulWidget {
  final DateTime startDate;
  final DateTime? endDate;

  const CustomEndDatePickerDialog({
    super.key,
    required this.startDate,
    this.endDate,
  });

  @override
  State<CustomEndDatePickerDialog> createState() =>
      _CustomEndDatePickerDialogState();
}

class _CustomEndDatePickerDialogState extends State<CustomEndDatePickerDialog> {
  DateTime? selectedDate;
  late DateTime currentMonth;
  final DateTime today = DateTime.now();

  @override
  void initState() {
    super.initState();
    selectedDate = widget.endDate;
    currentMonth = DateTime(widget.startDate.year, widget.startDate.month, 1);
  }

  void _selectDate(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  void _changeMonth(int increment) {
    if ((increment == -1 && currentMonth.isAfter(widget.startDate)) ||
        increment == 1) {
      setState(() {
        currentMonth =
            DateTime(currentMonth.year, currentMonth.month + increment, 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kWhiteColor,
      insetPadding: EdgeInsets.symmetric(horizontal: 96.w),
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
                  child: CalendarButton(
                    callback: () {
                      selectedDate = null;
                      setState(() {});
                    },
                    title: 'No date',
                    isSelected: selectedDate == null,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: CalendarButton(
                    callback: () {
                      _selectDate(today);
                    },
                    title: 'Today',
                    isSelected: selectedDate == today,
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
                  child: Icon(
                    Icons.arrow_left_rounded,
                    color: currentMonth.isBefore(widget.startDate)
                        ? kBorderColor
                        : kBlackColor,
                  ),
                ),
                Text(
                  DateFormat.yMMMM().format(currentMonth),
                  style:
                      TextStyle(fontSize: 6.sp, fontWeight: FontWeight.w500),
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
                        fontWeight: FontWeight.w400,
                        fontSize: 6.sp,
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 5),
            _buildCalendarGrid(),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/images/event.svg',
                  height: 24,
                  width: 24,
                ),
                SizedBox(width: 12),
                Text(
                  selectedDate == null
                      ? "No date"
                      : selectedDate!.displayDate(),
                  style: TextStyle(fontSize: 6.sp),
                ),
                Spacer(),
                CancelButton(),
                SizedBox(width: 16),
                SaveButton(
                  callback: () {
                    Navigator.pop(context, selectedDate);
                  },
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
          SizedBox(width: 10, height: 10)); // Empty spots before the first day
    }

    for (int day = 1; day <= daysInMonth; day++) {
      DateTime date = DateTime(currentMonth.year, currentMonth.month, day);
      // bool isToday = today.year == date.year &&
      //     today.month == date.month &&
      //     today.day == date.day;

      dayWidgets.add(
        GestureDetector(
          onTap: () => _selectDate(date),
          child: Container(
            width: 10,
            height: 10,
            alignment: Alignment.center,
            child: Text(
              "$day",
              style: TextStyle(
                fontSize: 6.sp,
                color: date.isBefore(widget.startDate)
                    ? kBorderColor
                    : selectedDate != null &&
                            DateTime(
                                  selectedDate!.year,
                                  selectedDate!.month,
                                  selectedDate!.day,
                                ) ==
                                date
                        ? kBlueColor
                        : kBlackColor,
              ),
            ),
          ),
        ),
      );
    }
    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      childAspectRatio: 3,
      padding: EdgeInsets.zero,
      children: dayWidgets,
    );
  }
}
