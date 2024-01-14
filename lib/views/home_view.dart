import 'package:flutter/material.dart';
import 'package:busme/constants/sizes/app_dimensions.dart';
import 'package:busme/constants/styles/app_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:busme/routes/app_routes.dart';
import 'package:fui_kit/fui_kit.dart';
import 'package:busme/constants/styles/app_text_styles.dart';
import 'package:busme/views/map_view.dart';

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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Buenos días,\nAnthony',
                            style: AppTextStyles.titleText(context),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(context, ROUTE_LOGIN, (route) => false);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.exitButtonColor,
                              padding: EdgeInsets.all(0.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.sp),
                              ),
                            ),
                            child: Container(
                              width: 40.sp,
                              height: 40.sp,
                              padding: EdgeInsets.all(10.sp),
                              child: FUI(
                                file: FUIcons.regularRounded.signOut,
                                color: AppColors.error,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25.sp,
                      ),
                      Text(
                        'Mapa en tiempo real',
                        style: AppTextStyles.labelText(context),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Container(
                        height: screenHeight*0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: MapView(),
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
