import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels_go/widgets/buttom_sheet_widgets/show_buttom_sheet_body.dart';

void showModalBottomSheetFunction(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12.sp),
        topRight: Radius.circular(12.sp),
      ),
    ),
    builder: (BuildContext context) {
      // Calculate the height of the modal as 90% of the screen height

      return const ShowButtomSheetBody();
    },
  );
}
