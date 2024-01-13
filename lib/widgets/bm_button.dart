import 'package:busme/constants/styles/app_colors.dart';
import 'package:busme/constants/styles/app_text_styles.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class BusMeButton extends StatefulWidget {
  final String titleText;
  final EdgeInsetsGeometry padding;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final Color? backgroundColor;

  BusMeButton({required this.titleText,
      required this.padding,
      required this.onPressed,
      this.textStyle,
      this.backgroundColor});

  @override
  State<BusMeButton> createState() => _BusMeButtonState();
}

class _BusMeButtonState extends State<BusMeButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              widget.backgroundColor ?? AppColors.buttonColor),
          minimumSize: MaterialStateProperty.all<Size>(
              Size(double.infinity, 35.sp)),
        ),
        child: Text(
          widget.titleText,
          style: widget.textStyle ?? AppTextStyles.buttonText(context),
        ),
      ),
    );
  }
}
