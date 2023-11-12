import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/widgets/text_utils.dart';

class EmptySelectedDateRangeWidget extends StatelessWidget {
  const EmptySelectedDateRangeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextUtils(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        text: 'Select Date',
        color: AppColors.primary,
      ),
    );
  }
}
