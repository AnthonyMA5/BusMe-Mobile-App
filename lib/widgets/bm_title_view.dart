import 'package:flutter/material.dart';
import 'package:busme/routes/app_routes.dart';
import 'package:fui_kit/fui_kit.dart';
import 'package:sizer/sizer.dart';
import 'package:busme/constants/styles/app_text_styles.dart';
import 'package:busme/constants/paths/icon_paths.dart';

class BusMeTitleView extends StatelessWidget {
  final String title;

  BusMeTitleView({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: FUI(
            file: IconPaths.back,
          ),
        ),
        SizedBox(width: 8.sp,),
        Text(
          title,
          style: AppTextStyles.titleText(context),
        ),
      ],
    );
  }
}
