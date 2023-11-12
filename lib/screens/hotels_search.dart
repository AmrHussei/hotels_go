import 'package:flutter/material.dart';

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
