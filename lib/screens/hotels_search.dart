import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels_go/core/utils/app_colors.dart';
import 'package:hotels_go/core/widgets/text_utils.dart';

import '../widgets/body_widgets/background_screen_widget.dart';
import '../widgets/body_widgets/center_content_widget.dart';

class HotelsSearch extends StatefulWidget {
  const HotelsSearch({super.key});

  @override
  State<HotelsSearch> createState() => _HotelsSearchState();
}

class _HotelsSearchState extends State<HotelsSearch> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackgroundScreenWidget(),
          CenterContentWidget(),
        ],
      ),
    );
  }
}

class ClipPathWidget extends StatelessWidget {
  const ClipPathWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipperWidget(),
      child: Container(
        padding: EdgeInsets.all(8.w),
        width: 0.5.sw,
        height: 50.h,
        color: AppColors.primary,
        alignment: AlignmentDirectional.centerStart,
        child: TextUtils(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          text: 'Hotels Search',
          color: Colors.white,
        ),
      ),
    );
  }
}

class ClipperWidget extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width - 60, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
