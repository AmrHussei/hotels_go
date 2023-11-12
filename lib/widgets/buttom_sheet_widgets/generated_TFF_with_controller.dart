import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/text_form_field_widget.dart';
import '../../core/widgets/text_utils.dart';

class GeneratedTFFWithController extends StatelessWidget {
  const GeneratedTFFWithController({
    super.key,
    required this.controllers,
  });

  final List<TextEditingController> controllers;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
      2,
      (index) {
        for (var i = 0; i < 2; i++) {
          controllers.add(TextEditingController());
        }
        return Padding(
          padding: EdgeInsets.only(right: 16.w, left: 26.w, bottom: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextUtils(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                text: 'Age of child ${index + 1}',
              ),
              SizedBox(
                height: 35.h,
                width: 80.w,
                child: TextFormFieldWidget(
                  enabled: false,
                  hint: '14 years',
                  keyboardType: TextInputType.number,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.sp,
                  ),
                  controller:
                      controllers.isNotEmpty ? controllers[index] : null,
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}
