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

  int num = 2;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    double modalHeight = screenHeight * 0.85;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.sp),
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
                  child: const CounterRowWithText(text: 'Rooms'),
                ),
                16.verticalSpace,
                Container(
                  height: 300.h,
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
                      16.verticalSpace,
                      const CounterRowWithText(text: 'Adults'),
                      16.verticalSpace,
                      const CounterRowWithText(text: 'Children'),
                      16.verticalSpace,
                      Expanded(
                        child: ListView.builder(
                          itemCount: num,
                          itemBuilder: (context, index) {
                            for (var i = 0; i < num; i++) {
                              controllers.add(TextEditingController());
                            }
                            return Padding(
                              padding: EdgeInsets.only(
                                  right: 16.w, left: 26.w, bottom: 16.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextUtils(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    text: 'Age of child ${index + 1}',
                                  ),
                                  SizedBox(
                                    height: 50.h,
                                    width: 80.w,
                                    child: TextFormFieldWidget(
                                      onChanged: (value) {},
                                      hint: '14 years',
                                      keyboardType: TextInputType.number,
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16.sp,
                                      ),
                                      controller: controllers.length > num
                                          ? controllers[num]
                                          : null,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
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
  });
  final String text;

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
          const CounterWidget()
        ],
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: Size(35.w, 35.h),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColors.primary),
                borderRadius: BorderRadius.circular(20.sp),
              ),
              backgroundColor: Colors.transparent),
          child: Icon(
            Icons.remove,
            color: AppColors.primary,
            size: 26.sp,
          ),
        ),
        10.horizontalSpace,
        TextUtils(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          text: '1',
        ),
        10.horizontalSpace,
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: Size(35.w, 35.h),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColors.primary),
                borderRadius: BorderRadius.circular(20.sp),
              ),
              backgroundColor: Colors.transparent),
          child: Icon(
            Icons.remove,
            color: AppColors.primary,
            size: 26.sp,
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
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox.shrink(),
          TextUtils(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            text: 'Rooms and Guests',
            color: Colors.black,
          ),

          // close icon
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
