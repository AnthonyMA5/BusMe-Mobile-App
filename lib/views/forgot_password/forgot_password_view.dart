import 'package:flutter/material.dart';
import 'package:busme/constants/styles/app_colors.dart';
import 'package:busme/constants/styles/app_text_styles.dart';
import 'package:fui_kit/fui_kit.dart';
import 'package:sizer/sizer.dart';
import 'package:busme/widgets/bm_text_field.dart';
import 'package:busme/routes/app_routes.dart';
import 'package:busme/widgets/bm_button.dart';

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context, ROUTE_LOGIN);
                            },
                            child: FUI(
                              file: FUIcons.regularRounded.arrowSmallLeft,
                            ),
                          ),
                          SizedBox(width: 8.sp,),
                          Text(
                            'Olvidé mi contraseña',
                            style: AppTextStyles.titleText(context),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.sp,),
                      Text('Ingresa el correo electrónico de tu cuenta para recibir un código y restaurar tu contraseña',
                        style: AppTextStyles.subtitleText(context),
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
                            ],
                          ),
                      ),
                      BusMeButton(
                          titleText: 'Continuar',
                          padding: EdgeInsets.symmetric(vertical: 50.sp),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                            }
                          },
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
