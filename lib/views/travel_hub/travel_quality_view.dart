import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:busme/constants/styles/app_colors.dart';
import 'package:busme/constants/styles/app_text_styles.dart';
import 'package:busme/widgets/bm_title_view.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fui_kit/fui_kit.dart';
import 'package:busme/widgets/bm_button.dart';
import 'package:busme/widgets/bm_comments_field.dart';

class TravelQualityView extends StatelessWidget {

  final TextEditingController _commentsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BusMeTitleView(
                        title: 'Valoración del viaje',
                      ),
                      SizedBox(height: 40.sp,),
                      Text(
                        'Miércoles, 24 de Enero de 2024',
                        style: AppTextStyles.contentText(context),
                      ),
                      Text(
                        '7:45 AM',
                        style: AppTextStyles.contentText(context),
                      ),
                      SizedBox(height: 40.sp,),
                      RatingBar.builder(
                        initialRating: 0,
                        minRating: 0,
                        maxRating: 5,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        unratedColor: AppColors.disabledButtonColor,
                        itemSize: 40.sp,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 5.sp),
                        itemBuilder: (context, _) => FUI(
                            file: FUIcons.solidStraight.star,
                            color: Color(0xFF00574D),
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      SizedBox(height: 40.sp),
                      BusMeCommentsField(
                        labelText: 'Si deseas agregar un comentario colócalo aquí...',
                        hintText: 'Cuéntanos más sobre tu experiencia...',
                        controller: _commentsController,
                      ),
                      BusMeButton(
                          titleText: 'Enviar calificación',
                          padding: EdgeInsets.symmetric(vertical:40.sp),
                          onPressed: (){},
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
