import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../texts/app_texts.dart';

class LargeTextField extends StatelessWidget {
  final String label;
  final bool isNumberInput;
  final double width;
  final void Function(String value)? onChanged;

  const LargeTextField({Key? key, required this.label, required this.isNumberInput, required this.width, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        keyboardType: isNumberInput == true ? TextInputType.number : TextInputType.text,
        style: AppTexts.simple,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelStyle: AppTexts.simple,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: AppColors.textBlack, width: 1.5)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: AppColors.textBlack, width: 1.5)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: AppColors.primary, width: 1.5)
          ),
          labelText: label,
        ),
        onChanged: onChanged,
      ),
    );
  }
}