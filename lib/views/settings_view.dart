import 'package:flutter/material.dart';
import 'package:busme/constants/sizes/app_dimensions.dart';
import 'package:busme/constants/styles/app_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:busme/routes/app_routes.dart';
import 'package:fui_kit/fui_kit.dart';
import 'package:busme/constants/styles/app_text_styles.dart';
import 'package:busme/widgets/bm_preference_switch.dart';
import 'package:busme/widgets/bm_clickable_icon_text.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _isSwitched = false;

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
                        'Ajustes',
                        style: AppTextStyles.titleText(context),
                      ),
                      SizedBox(
                        height: 30.sp,
                      ),
                      Text(
                        'Preferencias de notificaciones',
                        style: AppTextStyles.labelText(context),
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      BusMePreferenceSwitch(
                          label: 'Notificaciones de salida',
                          description: 'Recibirás una notificación al iniciar el recorrido del autobús',
                          value: _isSwitched,
                          onChanged: (value) {
                            setState(() {
                              _isSwitched = value;
                            });
                          },
                      ),
                      SizedBox(height: 15.sp,),
                      BusMePreferenceSwitch(
                          label: 'Notificaciones de llegada',
                          description: 'Recibirás una notificación al llegar al destino del autobús',
                          value: _isSwitched,
                          onChanged: (value) {
                            setState(() {
                              _isSwitched = value;
                            });
                          },
                      ),
                      SizedBox(height: 15.sp,),
                      BusMePreferenceSwitch(
                        label: 'Notificaciones de proximidad',
                        description: 'Recibirás una notificación antes de que el autobús llegue a un punto de abordaje',
                        value: _isSwitched,
                        onChanged: (value) {
                          setState(() {
                            _isSwitched = value;
                          });
                        },
                      ),
                      SizedBox(height: 25.sp,),
                      BusMeClickableIconText(
                        text: 'Términos y Condiciones',
                        onTap: (){
                          Navigator.pushNamed(context, ROUTE_TERMS_COND);
                        },
                      ),
                      SizedBox(height: 15.sp,),
                      BusMeClickableIconText(
                        text: 'Aviso de Privacidad',
                        onTap: (){
                          Navigator.pushNamed(context, ROUTE_PRIVACY_NOTICE);
                        },
                      ),
                      SizedBox(height: 20.sp,),
                      Text('Versión de la aplicación', style: AppTextStyles.labelText(context),),
                      SizedBox(height: 8.sp,),
                      Text('1.0.0', style: AppTextStyles.contentText(context),),
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
