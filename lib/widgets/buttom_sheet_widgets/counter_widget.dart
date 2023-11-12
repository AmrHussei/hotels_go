import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels_go/core/utils/app_colors.dart';
import 'package:hotels_go/core/widgets/text_utils.dart';

// ignore: must_be_immutable
class CounterWidget extends StatefulWidget {
  CounterWidget({
    super.key,
    required this.number,
  });
  int number;

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            if (widget.number == 1) return;
            setState(() {
              widget.number--;
            });
          },
          style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: Size(25.w, 35.w),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: widget.number == 1
                      ? AppColors.primaryShade
                      : AppColors.primary,
                ),
                borderRadius: BorderRadius.circular(20.sp),
              ),
              backgroundColor: Colors.transparent),
          child: Icon(
            Icons.remove,
            color:
                widget.number == 1 ? AppColors.primaryShade : AppColors.primary,
            size: 17.sp,
          ),
        ),
        10.horizontalSpace,
        TextUtils(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          text: widget.number.toString(),
        ),
        10.horizontalSpace,
        ElevatedButton(
          onPressed: () {
            if (widget.number == 4) return;
            setState(() {
              widget.number++;
            });
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            minimumSize: Size(25.w, 34.w),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: widget.number == 4
                    ? AppColors.primaryShade
                    : AppColors.primary,
              ),
              borderRadius: BorderRadius.circular(20.sp),
            ),
            backgroundColor: Colors.transparent,
          ),
          child: Icon(
            Icons.add,
            color:
                widget.number == 4 ? AppColors.primaryShade : AppColors.primary,
            size: 17.sp,
          ),
        ),
      ],
    );
  }
}
