import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels_go/core/widgets/text_utils.dart';
import 'package:hotels_go/widgets/buttom_sheet_widgets/counter_widget.dart';

class CounterRowWithText extends StatelessWidget {
  const CounterRowWithText({
    super.key,
    required this.text,
    required this.number,
  });
  final String text;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          TextUtils(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            text: text,
          ),
          const Spacer(),
          CounterWidget(
            number: number,
          )
        ],
      ),
    );
  }
}
