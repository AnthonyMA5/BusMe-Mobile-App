import 'package:flutter/material.dart';
import 'package:busme/constants/styles/app_text_styles.dart';

class BusMeLinkText extends StatelessWidget {

  final String text;
  final Alignment alignment;
  final VoidCallback onTap;

  BusMeLinkText({
    required this.text,
    required this.alignment,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.cyanAccent,
      onTap: onTap,
      child: Align(
        alignment: alignment,
        child: Text(
          text,
          style: AppTextStyles.highlightedText(context),
        ),
      ),
    );
  }
}