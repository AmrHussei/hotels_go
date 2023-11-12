import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels_go/core/widgets/text_utils.dart';
import 'package:hotels_go/widgets/buttom_sheet_widgets/show_modal_bottom_sheet_function.dart';

class FindHotelsButtonWidget extends StatelessWidget {
  const FindHotelsButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        showModalBottomSheetFunction(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            text: 'find hotels',
            color: Colors.white,
          ),
          10.horizontalSpace,
          Icon(
            Icons.search,
            color: Colors.white,
            size: 30.sp,
          ),
        ],
      ),
    );
  }
}
