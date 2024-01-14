import 'package:flutter/material.dart';
import 'package:busme/constants/styles/app_colors.dart';
import 'package:busme/constants/styles/app_text_styles.dart';
import 'package:fui_kit/fui_kit.dart';
import 'package:sizer/sizer.dart';
import 'package:busme/widgets/bm_text_field.dart';
import 'package:busme/routes/app_routes.dart';
import 'package:busme/widgets/bm_button.dart';
import 'package:busme/widgets/bm_title_view.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();

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
                      BusMeTitleView(
                          title: 'Olvidé mi contraseña',
                      ),
                      SizedBox(height: 15.sp,),
                      Text('Ingresa el correo electrónico de tu cuenta para recibir un código y restaurar tu contraseña',
                        style: AppTextStyles.contentText(context),
                      ),
                      SizedBox(height: 30.sp,),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              BusMeTextField(
                                labelText: 'Correo electrónico',
                                hintText: 'Ingresa tu correo electrónico',
                                keyboardType: TextInputType.emailAddress,
                                validator: validateEmail,
                                controller: _emailController,
                              ),
                              BusMeButton(
                                titleText: 'Continuar',
                                padding: EdgeInsets.symmetric(vertical: 50.sp),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pushNamedAndRemoveUntil(context, ROUTE_OTP_VERF, (route)=>false);
                                  }
                                },
                              ),
                            ],
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

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty ?? true) {
      return 'Por favor, ingresa tu correo electrónico';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value!)) {
      return 'Ingresa un correo electrónico válido';
    }
    return null;
  }
}
