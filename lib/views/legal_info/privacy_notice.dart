import 'package:flutter/material.dart';
import 'package:busme/widgets/bm_title_view.dart';
import 'package:busme/constants/styles/app_text_styles.dart';
import 'package:busme/constants/styles/app_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:busme/constants/sizes/app_dimensions.dart';

class PrivacyNoticeView extends StatelessWidget {
  const PrivacyNoticeView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = AppDimensions.screenWidth(context);
    double screenHeight = AppDimensions.screenHeight(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
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
                      BusMeTitleView(
                        title: 'Aviso de Privacidad',
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Container(
                        height: screenHeight * 0.78,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nuestro aviso de privacidad describe cómo recopilamos, '
                                'utilizamos y protegemos la información personal que '
                                'obtengamos a través de BusMe.',
                                style: AppTextStyles.contentText(context),
                              ),
                              SizedBox(
                                height: 20.sp,
                              ),
                              Text(
                                'Información Recopilada',
                                style: AppTextStyles.boldContentText(context),
                              ),
                              SizedBox(
                                height: 5.sp,
                              ),
                              Text(
                                'Recopilamos cierta información personal proporcionada '
                                'por tu institución, que puede incluir, entre otros, '
                                'datos de identificación, ubicación geográfica, '
                                'información de contacto y preferencias.',
                                style: AppTextStyles.contentText(context),
                              ),
                              SizedBox(
                                height: 20.sp,
                              ),
                              Text(
                                'Seguridad de la Información',
                                style: AppTextStyles.boldContentText(context),
                              ),
                              SizedBox(
                                height: 5.sp,
                              ),
                              Text(
                                'Nos comprometemos a proteger la información personal '
                                'recopilada y empleamos medidas de seguridad '
                                'apropiadas para evitar el acceso no autorizado, '
                                'divulgación, alteración o destrucción de dicha información.',
                                style: AppTextStyles.contentText(context),
                              ),
                              SizedBox(
                                height: 20.sp,
                              ),
                              Text(
                                'Compartir Información',
                                style: AppTextStyles.boldContentText(context),
                              ),
                              SizedBox(
                                height: 5.sp,
                              ),
                              Text(
                                'No compartiremos tu información personal con terceros, '
                                'salvo en los casos en que sea necesario para cumplir '
                                'con requisitos legales o cuando contemos con tu '
                                'consentimiento expreso.',
                                style: AppTextStyles.contentText(context),
                              ),
                              SizedBox(
                                height: 20.sp,
                              ),
                              Text(
                                'Derechos del Usuario',
                                style: AppTextStyles.boldContentText(context),
                              ),
                              SizedBox(
                                height: 5.sp,
                              ),
                              Text(
                                'Tienes derecho a acceder, corregir o eliminar '
                                'tus datos personales almacenados en nuestra aplicación.',
                                style: AppTextStyles.contentText(context),
                              ),
                            ],
                          ),
                        ),
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
