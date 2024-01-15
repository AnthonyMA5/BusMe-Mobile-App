import 'package:flutter/material.dart';
import 'package:busme/constants/sizes/app_dimensions.dart';
import 'package:busme/constants/styles/app_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:busme/routes/app_routes.dart';
import 'package:fui_kit/fui_kit.dart';
import 'package:busme/constants/styles/app_text_styles.dart';
import 'package:busme/widgets/bm_link_text.dart';

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Avisos',
                            style: AppTextStyles.titleText(context),
                          ),
                          BusMeLinkText(
                              text: 'Marcar todo como leído',
                              alignment: Alignment.centerRight,
                              onTap: (){print('avisos leídos');},
                          ),
                        ],
                      ),
                      SizedBox(height: 15.sp,),
                      Container(
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          color: AppColors.noticeUnreadColor,
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 2.sp, right: 10.sp),
                              child: Image(
                                image: AssetImage('assets/logos/logo.jpeg'),
                                width: 60.sp,
                                height: 60.sp,
                              ),
                            ),
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Suspensión de Transporte', style: AppTextStyles.noticeTitleText(context),),
                                    SizedBox(height: 5.sp,),
                                    Text('El servicio de transporte queda temporalmente suspendido hasta nuevo aviso debido a fallas técnicas.', style: AppTextStyles.noticeContentText(context),),
                                    SizedBox(height: 5.sp,),
                                    Text('Hace 8 horas', style: AppTextStyles.noticeTimeText(context),),
                                  ],
                                ),
                            ),
                          ],
                        ),
                      )
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
