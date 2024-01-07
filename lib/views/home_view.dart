import 'package:flutter/material.dart';
import 'package:busme/constants/sizes/app_dimensions.dart';
import 'package:busme/constants/styles/app_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:busme/routes/app_routes.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

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
                  padding: EdgeInsets.all(25.sp),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
