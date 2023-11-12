import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels_go/core/utils/app_colors.dart';
import 'package:hotels_go/core/utils/constant.dart';
import 'package:hotels_go/core/widgets/text_utils.dart';

import '../core/utils/assets_data.dart';
import '../core/widgets/text_form_field_widget.dart';
import '../widgets/dropdown_button_form_field_widget.dart';

class HotelsSearch extends StatefulWidget {
  const HotelsSearch({super.key});

  @override
  State<HotelsSearch> createState() => _HotelsSearchState();
}

class _HotelsSearchState extends State<HotelsSearch> {
  TextEditingController selectCityController = TextEditingController();

  DateTimeRange? selectedDateRange;

  Future<void> _selectDateRange(BuildContext context) async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2024),
      initialDateRange: selectedDateRange,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryTextTheme: const TextTheme(
                displayMedium: TextStyle(
              color: Colors.black,
            )),
            primaryColor: Colors.blue,
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            textTheme: const TextTheme(
              bodyLarge:
                  TextStyle(color: Colors.black), // Change the days' text color
            ),
            colorScheme: const ColorScheme.light(primary: Colors.blue)
                .copyWith(secondary: Colors.blue),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDateRange) {
      setState(() {
        selectedDateRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AssetsData.backgroundImage,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Container(
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
                              onChanged: (va) {},
                              controller: selectCityController,
                              fillColor: Colors.white,
                              filled: true,
                              hint: 'Select City',
                            ),
                            10.verticalSpace,
                            InkWell(
                              onTap: () => _selectDateRange(context),
                              child: Container(
                                width: double.infinity,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.blueAccent,
                                  ),
                                  borderRadius: BorderRadius.circular(18.sp),
                                ),
                                child: selectedDateRange == null
                                    ? Center(
                                        child: TextUtils(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          text: 'Select Date',
                                          color: AppColors.primary,
                                        ),
                                      )
                                    : Padding(
                                        padding: EdgeInsets.all(7.w),
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppColors.deepBlue,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.sp),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const SizedBox.shrink(),
                                              Center(
                                                child: TextUtils(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                  text:
                                                      '${selectedDateRange!.start.year}-${selectedDateRange!.start.month}-${selectedDateRange!.start.day} ==> ${selectedDateRange!.end.year}-${selectedDateRange!.end.month}-${selectedDateRange!.end.day}',
                                                  color: AppColors.deepBlue,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 5.w),
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedDateRange = null;
                                                    });
                                                  },
                                                  child: const Icon(
                                                    Icons.close,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                              ),
                            ),
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
                    MaterialButton(
                      onPressed: () {
                        _showModalBottomSheet(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextUtils(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            text: 'find hotels',
                            color: Colors.white,
                          ),
                          10.horizontalSpace,
                          Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 30.sp,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

void _showModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12.sp),
        topRight: Radius.circular(12.sp),
      ),
    ),
    builder: (BuildContext context) {
      // Calculate the height of the modal as 90% of the screen height

      return const ShowButtomsheetBody();
    },
  );
}

class ShowButtomsheetBody extends StatefulWidget {
  const ShowButtomsheetBody({
    super.key,
  });

  @override
  State<ShowButtomsheetBody> createState() => _ShowButtomsheetBodyState();
}

class _ShowButtomsheetBodyState extends State<ShowButtomsheetBody> {
  List<TextEditingController> controllers = [];

  int roomsNum = 1;
  int childrenNum = 2;
  int adultsNum = 4;
  bool switchValue = false;

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
                      Padding(
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
                      ),
                      12.verticalSpace,
                      CounterRowWithText(text: 'Adults', number: adultsNum),
                      12.verticalSpace,
                      CounterRowWithText(text: 'Children', number: childrenNum),
                      12.verticalSpace,
                      Column(
                          children: List.generate(
                        childrenNum,
                        (index) {
                          for (var i = 0; i < childrenNum; i++) {
                            controllers.add(TextEditingController());
                          }
                          return Padding(
                            padding: EdgeInsets.only(
                                right: 16.w, left: 26.w, bottom: 16.h),
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
                                    onChanged: (value) {},
                                    hint: '14 years',
                                    keyboardType: TextInputType.number,
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.sp,
                                    ),
                                    controller: controllers.length > childrenNum
                                        ? controllers[index]
                                        : null,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      )),
                    ],
                  ),
                ),
                16.verticalSpace,
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
                ),
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

class FixedWordInputFormatter extends TextInputFormatter {
  final String fixedWord;

  FixedWordInputFormatter(this.fixedWord);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.endsWith(fixedWord)) {
      return newValue;
    } else {
      String newText = '${newValue.text}$fixedWord';
      return newValue.copyWith(
          text: newText,
          selection: TextSelection.collapsed(offset: newText.length));
    }
  }
}

class CounterRowWithText extends StatelessWidget {
  const CounterRowWithText({
    super.key,
    required this.text,
    required this.number,
  });
  final String text;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          TextUtils(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            text: text,
          ),
          const Spacer(),
          CounterWidget(
            number: number,
          )
        ],
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  CounterWidget({
    super.key,
    required this.number,
  });
  int number;

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            if (widget.number == 1) return;
            setState(() {
              widget.number--;
            });
          },
          style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: Size(25.w, 35.w),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: widget.number == 1
                      ? AppColors.primaryShade
                      : AppColors.primary,
                ),
                borderRadius: BorderRadius.circular(20.sp),
              ),
              backgroundColor: Colors.transparent),
          child: Icon(
            Icons.remove,
            color:
                widget.number == 1 ? AppColors.primaryShade : AppColors.primary,
            size: 17.sp,
          ),
        ),
        10.horizontalSpace,
        TextUtils(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          text: widget.number.toString(),
        ),
        10.horizontalSpace,
        ElevatedButton(
          onPressed: () {
            if (widget.number == 4) return;
            setState(() {
              widget.number++;
            });
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            minimumSize: Size(25.w, 34.w),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: widget.number == 4
                    ? AppColors.primaryShade
                    : AppColors.primary,
              ),
              borderRadius: BorderRadius.circular(20.sp),
            ),
            backgroundColor: Colors.transparent,
          ),
          child: Icon(
            Icons.add,
            color:
                widget.number == 4 ? AppColors.primaryShade : AppColors.primary,
            size: 17.sp,
          ),
        ),
      ],
    );
  }
}

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
