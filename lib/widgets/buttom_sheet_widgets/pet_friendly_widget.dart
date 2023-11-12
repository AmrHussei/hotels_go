import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/widgets/text_utils.dart';

class PetFriendlyWidget extends StatefulWidget {
  const PetFriendlyWidget({super.key});

  @override
  State<PetFriendlyWidget> createState() => _PetFriendlyWidgetState();
}

class _PetFriendlyWidgetState extends State<PetFriendlyWidget> {
  bool switchValue = false;
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
            Stack(
              alignment: Alignment.center,
              children: [
                CupertinoSwitch(
                  value: switchValue,
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                    });
                    // Add your logic for handling switch state changes.
                  },
                ),
                if (!switchValue)
                  Positioned(
                    right: 8.w,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          switchValue = !switchValue;
                        });
                      },
                      child: Container(
                        width: 10.w,
                        height: 10.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border(
                            top: BorderSide(
                              width: 1.w,
                              color: Colors.grey,
                            ),
                            bottom: BorderSide(
                              width: 1.w,
                              color: Colors.grey,
                            ),
                            left: BorderSide(
                              width: 1.w,
                              color: Colors.grey,
                            ),
                            right: BorderSide(
                              width: 1.w,
                              color: Colors.grey,
                            ),
                          ),
                          color: Colors
                              .transparent, // Customize the color of the circle
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
