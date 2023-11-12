import 'package:flutter/material.dart';

import '../../core/utils/assets_data.dart';

class BackgroundScreenWidget extends StatelessWidget {
  const BackgroundScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsData.backgroundImage,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    );
  }
}
