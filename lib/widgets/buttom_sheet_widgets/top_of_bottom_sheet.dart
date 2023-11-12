import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels_go/core/widgets/text_utils.dart';

class TopOfBottomSheet extends StatelessWidget {
  const TopOfBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.sp),
          topRight: Radius.circular(18.sp),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Center(
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const SizedBox.shrink(),
          title: TextUtils(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            text: 'Rooms and Guests',
            color: Colors.black,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
