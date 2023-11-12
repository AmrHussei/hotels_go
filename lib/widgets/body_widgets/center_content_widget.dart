import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels_go/core/utils/app_colors.dart';
import 'package:hotels_go/widgets/body_widgets/date_range_widget.dart';
import 'package:hotels_go/widgets/body_widgets/dropdown_button_form_field_widget.dart';
import 'package:hotels_go/widgets/body_widgets/find_hotels_button_widget.dart';

import '../../core/utils/constant.dart';
import '../../core/widgets/text_form_field_widget.dart';
import '../../screens/hotels_search.dart';

class CenterContentWidget extends StatefulWidget {
  const CenterContentWidget({super.key});

  @override
  State<CenterContentWidget> createState() => _CenterContentWidgetState();
}

class _CenterContentWidgetState extends State<CenterContentWidget> {
  TextEditingController selectCityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ClipPathWidget(),
            5.verticalSpace,
            Container(
              height: 300.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(18.sp)),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.primaryShade, AppColors.primary],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                      ),
                      borderRadius: BorderRadius.circular(18.sp),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Column(
                        children: [
                          14.verticalSpace,
                          TextFormFieldWidget(
                            controller: selectCityController,
                            fillColor: Colors.white,
                            filled: true,
                            hint: 'Select City',
                          ),
                          10.verticalSpace,
                          const DateRangeWidget(),
                          10.verticalSpace,
                          DropdownButtonFormFieldWidget(
                            itemList: nationalities,
                            hintText: 'Select Nationality',
                          ),
                          10.verticalSpace,
                          DropdownButtonFormFieldWidget(
                            itemList: roomList,
                            hintText: '1 Room, 1 Adult, 0 Children',
                          ),
                          14.verticalSpace
                        ],
                      ),
                    ),
                  ),
                  const FindHotelsButtonWidget()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
