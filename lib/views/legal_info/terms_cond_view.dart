import 'package:flutter/material.dart';
import 'package:busme/widgets/bm_title_view.dart';
import 'package:busme/constants/styles/app_text_styles.dart';
import 'package:busme/constants/styles/app_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:busme/constants/sizes/app_dimensions.dart';

class TermsConditionsView extends StatelessWidget {
  const TermsConditionsView({super.key});

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
                        title: 'Términos y Condiciones',
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
                                '¡Bienvenido a BusMe! Antes de utilizar nuestros servicios, '
                                'te pedimos que leas detenidamente los siguientes términos y '
                                'condiciones que rigen tu interacción con nuestra plataforma.',
                                style: AppTextStyles.contentText(context),
                              ),
                              SizedBox(
                                height: 20.sp,
                              ),
                              Text(
                                '1. Aceptación de los Términos',
                                style: AppTextStyles.boldContentText(context),
                              ),
                              SizedBox(
                                height: 5.sp,
                              ),
                              Text(
                                'Al utilizar nuestra aplicación, aceptas automáticamente estos '
                                'términos y condiciones, así como nuestra Política de Privacidad. '
                                'Si no estás de acuerdo con alguno de estos términos, '
                                'te pedimos que no utilices nuestra aplicación.',
                                style: AppTextStyles.contentText(context),
                              ),
                              SizedBox(
                                height: 20.sp,
                              ),
                              Text(
                                '2. Información Personal y Privacidad',
                                style: AppTextStyles.boldContentText(context),
                              ),
                              SizedBox(
                                height: 5.sp,
                              ),
                              Text(
                                'Recopilamos y utilizamos cierta información personal, '
                                'incluidos datos de localización, proporcionados por '
                                'tu institución para mejorar y personalizar tu '
                                'experiencia con nuestra aplicación. Garantizamos '
                                'la confidencialidad y seguridad de estos datos, '
                                'conforme a nuestra Política de Privacidad.',
                                style: AppTextStyles.contentText(context),
                              ),
                              SizedBox(
                                height: 20.sp,
                              ),
                              Text(
                                '3. Uso de la Información',
                                style: AppTextStyles.boldContentText(context),
                              ),
                              SizedBox(
                                height: 5.sp,
                              ),
                              Text(
                                'La información recopilada será utilizada '
                                'únicamente para mejorar nuestros servicios, '
                                'implementar nuevas funciones y características, '
                                'así como para fines analíticos internos. '
                                'No compartiremos tu información personal con '
                                'terceros sin tu consentimiento explícito, a '
                                'menos que sea requerido por ley.',
                                style: AppTextStyles.contentText(context),
                              ),
                              SizedBox(
                                height: 20.sp,
                              ),
                              Text(
                                '4. Derechos de Propiedad',
                                style: AppTextStyles.boldContentText(context),
                              ),
                              SizedBox(
                                height: 5.sp,
                              ),
                              Text(
                                'Todos los derechos de propiedad intelectual '
                                'asociados con la aplicación, incluyendo '
                                'pero no limitándose a software, diseños, '
                                'logotipos y contenido, pertenecen a nuestra '
                                'empresa. No se permite el uso no autorizado '
                                'de ninguno de estos elementos.',
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
