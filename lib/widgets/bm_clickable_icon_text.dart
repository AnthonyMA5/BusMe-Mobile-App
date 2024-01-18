import 'package:flutter/material.dart';
import 'package:fui_kit/fui_kit.dart';
import 'package:busme/constants/styles/app_text_styles.dart';
import 'package:busme/constants/paths/icon_paths.dart';

class BusMeClickableIconText extends StatelessWidget {

  final String text;
  final VoidCallback onTap;

  BusMeClickableIconText({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child:
      Row(
        children: [
          Text(text, style: AppTextStyles.labelText(context),),
          Spacer(),
          IconButton(
            onPressed: onTap,
            icon: FUI(
              file: IconPaths.next,
            ),
          ),
        ],
      ),
    );
  }
}
