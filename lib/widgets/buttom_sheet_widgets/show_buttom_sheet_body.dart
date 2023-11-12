import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels_go/core/widgets/text_utils.dart';
import 'package:hotels_go/widgets/buttom_sheet_widgets/Generated_TFF_with_controller.dart';
import 'package:hotels_go/widgets/buttom_sheet_widgets/counter_row_with_text.dart';
import 'package:hotels_go/widgets/buttom_sheet_widgets/pet_friendly_widget.dart';
import 'package:hotels_go/widgets/buttom_sheet_widgets/room_title_widget.dart';
import 'package:hotels_go/widgets/buttom_sheet_widgets/top_of_bottom_sheet.dart';

class ShowButtomSheetBody extends StatefulWidget {
  const ShowButtomSheetBody({
    super.key,
  });

  @override
  State<ShowButtomSheetBody> createState() => _ShowButtomSheetBodyState();
}

class _ShowButtomSheetBodyState extends State<ShowButtomSheetBody> {
  List<TextEditingController> controllers = [];

  int roomsNum = 1;
  int childrenNum = 2;
  int adultsNum = 4;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    double modalHeight = screenHeight * 0.92;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.sp),
          topRight: Radius.circular(18.sp),
        ),
      ),
      height: modalHeight,
      child: ListView(
        children: [
          const TopOfBottomSheet(),
          Padding(
            padding: EdgeInsets.all(16.h),
            child: Column(
              children: [
                Container(
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
                  child: CounterRowWithText(text: 'Rooms', number: roomsNum),
                ),
                16.verticalSpace,
                Container(
                  // height: 300.h,
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      12.verticalSpace,
                      const RoomTitleWidget(),
                      12.verticalSpace,
                      CounterRowWithText(text: 'Adults', number: adultsNum),
                      12.verticalSpace,
                      CounterRowWithText(text: 'Children', number: childrenNum),
                      12.verticalSpace,
                      GeneratedTFFWithController(controllers: controllers),
                    ],
                  ),
                ),
                16.verticalSpace,
                const PetFriendlyWidget(),
                90.verticalSpace,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                    double.infinity,
                    45.h,
                  )),
                  onPressed: () {},
                  child: TextUtils(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    text: 'Apply',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
