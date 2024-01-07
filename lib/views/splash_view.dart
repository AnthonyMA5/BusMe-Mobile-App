import 'package:busme/constants/sizes/app_dimensions.dart';
import 'package:busme/constants/strings/image_strings.dart';
import 'package:busme/constants/strings/text_strings.dart';
import 'package:busme/constants/styles/app_colors.dart';
import 'package:busme/constants/styles/app_text_styles.dart';
import 'package:busme/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    double screenWidth = AppDimensions.screenWidth(context);
    double screenHeight = AppDimensions.screenHeight(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Container(
          color: AppColors.backgroundColor,
          width: screenWidth,
          height: screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100.sp,
                height: 100.sp,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageStrings.appLogo),
                      fit: BoxFit.cover,
                    )),
              ),
              Text(
                TextStrings.appName,
                style: AppTextStyles.titleText(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, ROUTE_LOGIN, (route) => false);
    });
  }
}
