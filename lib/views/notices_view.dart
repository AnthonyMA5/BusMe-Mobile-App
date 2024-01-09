import 'package:flutter/material.dart';
import 'package:busme/constants/sizes/app_dimensions.dart';
import 'package:busme/constants/styles/app_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:busme/routes/app_routes.dart';
import 'package:fui_kit/fui_kit.dart';
import 'package:busme/constants/styles/app_text_styles.dart';
import 'package:busme/views/map_view.dart';

class NoticesView extends StatefulWidget {
  const NoticesView({super.key});

  @override
  State<NoticesView> createState() => _NoticesViewState();
}

class _NoticesViewState extends State<NoticesView> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = AppDimensions.screenWidth(context);
    double screenHeight = AppDimensions.screenHeight(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Container(
                  color: AppColors.backgroundColor,
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Avisos',
                        style: AppTextStyles.titleText(context),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
