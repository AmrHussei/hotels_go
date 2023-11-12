import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels_go/widgets/buttom_sheet_widgets/cupertino_switch_widget.dart';

import '../../core/widgets/text_utils.dart';

class PetFriendlyWidget extends StatefulWidget {
  const PetFriendlyWidget({super.key});

  @override
  State<PetFriendlyWidget> createState() => _PetFriendlyWidgetState();
}

class _PetFriendlyWidgetState extends State<PetFriendlyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 10.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TextUtils(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      text: 'pet-friendly',
                    ),
                    5.horizontalSpace,
                    const Icon(Icons.info_outline)
                  ],
                ),
                const Spacer(),
                TextUtils(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                  text: 'only show stays that allow pets',
                ),
              ],
            ),
            const Spacer(),
            const CupertinoSwitchWidget()
          ],
        ),
      ),
    );
  }
}
