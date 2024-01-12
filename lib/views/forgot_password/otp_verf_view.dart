import 'package:flutter/material.dart';
import 'package:busme/constants/styles/app_text_styles.dart';
import 'package:busme/constants/styles/app_colors.dart';
import 'package:busme/widgets/bm_button.dart';
import 'package:sizer/sizer.dart';

class OTPVerificationView extends StatelessWidget {

  List<TextEditingController> _controllers = List.generate(5, (index) => TextEditingController());
  List<FocusNode> _focusNodes = List.generate(5, (index) => FocusNode());

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Verificación OTP',
                        style: AppTextStyles.titleText(context),
                      ),
                      SizedBox(height: 15.sp,),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Enviamos un código de 5 dígitos al siguiente correo: ',
                              style: AppTextStyles.contentText(context),
                            ),
                            TextSpan(
                              text: 'ejemplo@dominio.com',
                              style: AppTextStyles.boldContentText(context),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.sp,),
                      Text(
                        'Ingrésalo a continuación para restablecer tu contraseña',
                        style: AppTextStyles.contentText(context),
                      ),
                      SizedBox(height: 30.sp,),
                      Form(
                          child: Row(
                            children: [
                              for (int i = 0; i < 5; i++)
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 9.sp),
                                    child: TextFormField(
                                      controller: _controllers[i],
                                      focusNode: _focusNodes[i],
                                      keyboardType: TextInputType.number,
                                      maxLength: 1,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.otpText(context),
                                      decoration: InputDecoration(
                                        counterText: '',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.sp),
                                          borderSide: BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.sp),
                                          borderSide: BorderSide(color: AppColors.primaryColor),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          if ( i < 4 ) {
                                            FocusScope.of(context).requestFocus(_focusNodes[i+1]);
                                          } else {
                                            _focusNodes[i].unfocus();
                                          }
                                        }
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Ingrese un dígito';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                            ],
                          ),
                      ),
                      BusMeButton(
                          titleText: 'Verificar código',
                          padding: EdgeInsets.only(top: 50.sp),
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

