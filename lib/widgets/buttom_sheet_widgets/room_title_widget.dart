import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/text_utils.dart';

class RoomTitleWidget extends StatelessWidget {
  const RoomTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          TextUtils(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            text: 'Room 1',
          ),
        ],
      ),
    );
  }
}
