import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';

class CupertinoSwitchWidget extends StatefulWidget {
  const CupertinoSwitchWidget({super.key});

  @override
  State<CupertinoSwitchWidget> createState() => _CupertinoSwitchWidgetState();
}

class _CupertinoSwitchWidgetState extends State<CupertinoSwitchWidget> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  color:
                      Colors.transparent, // Customize the color of the circle
                ),
              ),
            ),
          ),
      ],
    );
  }
}
