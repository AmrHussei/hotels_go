import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/text_form_field_widget.dart';
import '../../core/widgets/text_utils.dart';

class GeneratedTFFWithController extends StatefulWidget {
  const GeneratedTFFWithController({
    super.key,
    required this.childrenNum,
  });
  final int childrenNum;

  @override
  State<GeneratedTFFWithController> createState() =>
      _GeneratedTFFWithControllerState();
}

class _GeneratedTFFWithControllerState
    extends State<GeneratedTFFWithController> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
      widget.childrenNum,
      (index) {
        return Padding(
          padding: EdgeInsets.only(right: 16.w, left: 26.w, bottom: 16.h),
          child: AgeOfChildWidget(index: index),
        );
      },
    ));
  }
}

class AgeOfChildWidget extends StatefulWidget {
  const AgeOfChildWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<AgeOfChildWidget> createState() => _AgeOfChildWidgetState();
}

class _AgeOfChildWidgetState extends State<AgeOfChildWidget> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextUtils(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          text: 'Age of child ${widget.index + 1}',
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
            controller: textEditingController,
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
