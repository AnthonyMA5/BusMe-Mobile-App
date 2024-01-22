import 'package:flutter/material.dart';
import 'package:busme/constants/styles/app_text_styles.dart';
import 'package:busme/constants/styles/app_colors.dart';
import 'package:sizer/sizer.dart';

class BusMeCommentsField extends StatelessWidget {

  final String labelText, hintText;
  final TextEditingController controller;

  BusMeCommentsField({
    this.labelText,
    this.hintText,
    this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: AppTextStyles.labelText(context),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 10.sp),
        TextFormField(
          keyboardType: TextInputType.text,
          style: AppTextStyles.subtitleText(context),
          maxLines: 6,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.secondaryBackgroundColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.sp),
              borderSide: BorderSide(
                color: AppColors.secondaryBackgroundColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.aditional,
              ),
              borderRadius: BorderRadius.circular(8.sp),
            ),
            hintText: hintText,
            hintStyle: AppTextStyles.hintText(context),
            contentPadding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 10.sp),
          ),
          controller: controller,
        ),
      ],
    );
  }
}
