import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
                  color: AppColors.textBlack,
                  indent: 1,
                  endIndent: 1,
                  thickness: 2,
                );
  }
}