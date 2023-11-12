import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels_go/widgets/body_widgets/empty_selected_date_range_widget.dart';

import '../../core/utils/app_colors.dart';
import '../../core/widgets/text_utils.dart';

class DateRangeWidget extends StatefulWidget {
  const DateRangeWidget({
    super.key,
  });

  @override
  State<DateRangeWidget> createState() => _DateRangeWidgetState();
}

DateTimeRange? selectedDateRange;

class _DateRangeWidgetState extends State<DateRangeWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectDateRange(context),
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.blueAccent,
          ),
          borderRadius: BorderRadius.circular(18.sp),
        ),
        child: selectedDateRange == null
            ? const EmptySelectedDateRangeWidget()
            : Padding(
                padding: EdgeInsets.all(7.w),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.deepBlue,
                    ),
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox.shrink(),
                      Center(
                        child: TextUtils(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          text:
                              '${selectedDateRange!.start.year}-${selectedDateRange!.start.month}-${selectedDateRange!.start.day} ==> ${selectedDateRange!.end.year}-${selectedDateRange!.end.month}-${selectedDateRange!.end.day}',
                          color: AppColors.deepBlue,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5.w),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedDateRange = null;
                            });
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Future<void> _selectDateRange(BuildContext context) async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2024),
      initialDateRange: selectedDateRange,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryTextTheme: const TextTheme(
                displayMedium: TextStyle(
              color: Colors.black,
            )),
            primaryColor: Colors.blue,
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            textTheme: const TextTheme(
              bodyLarge:
                  TextStyle(color: Colors.black), // Change the days' text color
            ),
            colorScheme: const ColorScheme.light(primary: Colors.blue)
                .copyWith(secondary: Colors.blue),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDateRange) {
      setState(() {
        selectedDateRange = picked;
      });
    }
  }
}
