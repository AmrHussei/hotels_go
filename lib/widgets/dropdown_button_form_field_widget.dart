import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels_go/core/utils/app_colors.dart';
import 'package:hotels_go/core/widgets/text_utils.dart';

class DropdownButtonFormFieldWidget extends StatefulWidget {
  const DropdownButtonFormFieldWidget(
      {super.key, required this.itemList, required this.hintText});
  final List<String> itemList;
  final String hintText;
  @override
  State<DropdownButtonFormFieldWidget> createState() =>
      _DropdownButtonFormFieldWidgetState();
}

class _DropdownButtonFormFieldWidgetState
    extends State<DropdownButtonFormFieldWidget> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: DropdownButtonFormField(
        menuMaxHeight: 400.h,
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          size: 26.sp,
        ),
        hint: TextUtils(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          text: widget.hintText,
          color: AppColors.primary,
        ),
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 16.sp,
        ),
        isDense: true,
        isExpanded: true,
        itemHeight: 50.h,
        borderRadius: BorderRadius.circular(18.sp),
        dropdownColor: Colors.white,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(
              18.sp,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(
              18.sp,
            ),
          ),
        ),
        items: widget.itemList
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            )
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
      ),
    );
  }
}
