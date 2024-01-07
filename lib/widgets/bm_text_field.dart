
import 'package:fui_kit/fui_kit.dart';
import 'package:flutter/material.dart';
import 'package:busme/constants/styles/app_colors.dart';
import 'package:busme/constants/styles/app_text_styles.dart';
import 'package:sizer/sizer.dart';

class BusMeTextField extends StatefulWidget {

  final String labelText, hintText;
  final TextInputType keyboardType;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final int? maxLines;
  final bool? showIcon, obscureText;
  final String? icon;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onIconTap;

  BusMeTextField({
    required this.labelText,
    required this.hintText,
    required this.keyboardType,
    required this.validator,
    required this.controller,
    this.maxLines,
    this.showIcon,
    this.obscureText,
    this.icon,
    this.onChanged,
    this.onIconTap});

  @override
  State<BusMeTextField> createState() => _BusMeTextFieldState();
}

class _BusMeTextFieldState extends State<BusMeTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: AppTextStyles.labelText(context),
          ),
          TextFormField(
            maxLines: widget.maxLines ?? 1,
            cursorColor: AppColors.primaryColor,
            keyboardType: widget.keyboardType,
            style: AppTextStyles.subtitleText(context),
            onChanged: widget.onChanged,
            obscureText: widget.obscureText ?? false,
            decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: AppTextStyles.hintText(context),
                suffixIcon: widget.showIcon ?? false == true
                    ? Padding(
                  padding: EdgeInsets.all(5.sp),
                  child: GestureDetector(
                    onTap: widget.onIconTap,
                    child: FUI(
                      file: widget.icon ?? FUIcons.regularRounded.addressBook,
                      width: 18.sp,
                      height: 18.sp,
                      color: AppColors.disabledButtonColor,
                    ),
                  ),
                ) : null,
                errorStyle: AppTextStyles.errorText(context),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.primaryColor),
                )),
            controller: widget.controller,
            validator: widget.validator,
          ),
        ],
      ),
    );
  }
}
