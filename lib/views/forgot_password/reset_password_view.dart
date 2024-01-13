import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:fui_kit/fui_kit.dart';
import 'package:busme/constants/styles/app_colors.dart';
import 'package:busme/constants/styles/app_text_styles.dart';
import 'package:busme/widgets/bm_button.dart';
import 'package:busme/widgets/bm_text_field.dart';
import 'package:busme/widgets/bm_validity_indicator.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController = TextEditingController();

  bool _isVisible = false;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;
  bool _hasSpecialChar = false;
  bool _hasUpperLowerCase = false;
  bool _isPasswordMatched = false;
  bool _isButtonEnabled = false;
  bool _areFunctionsCompleted = false;

  checkIfFunctionsCompleted() {
    setState(() {
      _areFunctionsCompleted = _isPasswordEightCharacters &&
          _hasUpperLowerCase &&
          _hasPasswordOneNumber &&
          _hasSpecialChar &&
          _isPasswordMatched;

      _isButtonEnabled = _areFunctionsCompleted;
    });
  }

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    final uppercaseRegex = RegExp(r'[A-Z]');
    final lowercaseRegex = RegExp(r'[a-z]');
    final specialCharRegex = RegExp(r'[^\w\d]');

    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8) _isPasswordEightCharacters = true;

      _hasUpperLowerCase = false;
      if (lowercaseRegex.hasMatch(password) &&
          uppercaseRegex.hasMatch(password)) _hasUpperLowerCase = true;

      _hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) _hasPasswordOneNumber = true;

      _hasSpecialChar = false;
      if (specialCharRegex.hasMatch(password)) _hasSpecialChar = true;
    });

    checkIfFunctionsCompleted();
  }

  onPasswordMatched(String password) {
    setState(() {
      _isPasswordMatched = false;
      if (_newPasswordController.value == _confirmNewPasswordController.value)
        _isPasswordMatched = true;
    });

    checkIfFunctionsCompleted();
  }

  @override
  Widget build(BuildContext context) {
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
                        'Crea tu nueva contraseña',
                        style: AppTextStyles.titleText(context),
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Text(
                        'Crear una nueva contraseña hará que la contraseña anterior sea eliminada',
                        style: AppTextStyles.subtitleText(context),
                      ),
                      SizedBox(
                        height: 25.sp,
                      ),
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BusMeTextField(
                              labelText: 'Ingresa tu nueva contraseña',
                              hintText: 'Coloca tu contraseña aquí',
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: !_isVisible,
                              showIcon: true,
                              icon: _isVisible
                                  ? FUIcons.regularRounded.eyeCrossed
                                  : FUIcons.regularRounded.eye,
                              validator: (String? input) {
                                if (input == null || input.isEmpty) {
                                  return 'Por favor, ingrese un valor válido.';
                                }
                                return null;
                              },
                              controller: _newPasswordController,
                              onIconTap: () {
                                setState(() {
                                  _isVisible = !_isVisible;
                                });
                              },
                              onChanged: onPasswordChanged,
                            ),
                            SizedBox(
                              height: 10.sp,
                            ),
                            Text(
                              'Tu contraseña debe tener:',
                              style: AppTextStyles.conditionalText(context),
                            ),
                            SizedBox(
                              height: 15.sp,
                            ),
                            BusMeValidityIndicator(
                              text: 'Al menos 8 caracteres',
                              textStyle: _isPasswordEightCharacters
                                  ? AppTextStyles.successSmallText(context)
                                  : AppTextStyles.conditionalText(context),
                              icon: Icons.check,
                              fillColor: _isPasswordEightCharacters
                                  ? Colors.green
                                  : Colors.transparent,
                              border: _isPasswordEightCharacters
                                  ? Border.all(color: Colors.transparent)
                                  : Border.all(color: Colors.grey.shade400),
                            ),
                            SizedBox(
                              height: 10.sp,
                            ),
                            BusMeValidityIndicator(
                              text: 'Mayúsculas y minúsculas',
                              textStyle: _hasUpperLowerCase
                                  ? AppTextStyles.successSmallText(context)
                                  : AppTextStyles.conditionalText(context),
                              icon: Icons.check,
                              fillColor: _hasUpperLowerCase
                                  ? Colors.green
                                  : Colors.transparent,
                              border: _hasUpperLowerCase
                                  ? Border.all(color: Colors.transparent)
                                  : Border.all(color: Colors.grey.shade400),
                            ),
                            SizedBox(
                              height: 10.sp,
                            ),
                            BusMeValidityIndicator(
                              text: 'Al menos 1 número',
                              textStyle: _hasPasswordOneNumber
                                  ? AppTextStyles.successSmallText(context)
                                  : AppTextStyles.conditionalText(context),
                              icon: Icons.check,
                              fillColor: _hasPasswordOneNumber
                                  ? Colors.green
                                  : Colors.transparent,
                              border: _hasPasswordOneNumber
                                  ? Border.all(color: Colors.transparent)
                                  : Border.all(color: Colors.grey.shade400),
                            ),
                            SizedBox(
                              height: 10.sp,
                            ),
                            BusMeValidityIndicator(
                              text: 'Algún caracter especial',
                              textStyle: _hasSpecialChar
                                  ? AppTextStyles.successSmallText(context)
                                  : AppTextStyles.conditionalText(context),
                              icon: Icons.check,
                              fillColor: _hasSpecialChar
                                  ? Colors.green
                                  : Colors.transparent,
                              border: _hasSpecialChar
                                  ? Border.all(color: Colors.transparent)
                                  : Border.all(color: Colors.grey.shade400),
                            ),
                            SizedBox(
                              height: 40.sp,
                            ),
                            BusMeTextField(
                              labelText: 'Confirma tu nueva contraseña',
                              hintText: 'Ingresa nuevamente tu contraseña',
                              keyboardType: TextInputType.visiblePassword,
                              validator: (String) {},
                              controller: _confirmNewPasswordController,
                              onChanged: onPasswordMatched,
                            ),
                            SizedBox(
                              height: 10.sp,
                            ),
                            BusMeValidityIndicator(
                              text: 'Las contraseñas coinciden',
                              textStyle: _isPasswordMatched
                                  ? AppTextStyles.successSmallText(context)
                                  : AppTextStyles.conditionalText(context),
                              icon: Icons.check,
                              fillColor: _isPasswordMatched
                                  ? Colors.green
                                  : Colors.transparent,
                              border: _isPasswordMatched
                                  ? Border.all(color: Colors.transparent)
                                  : Border.all(color: Colors.grey.shade400),
                            ),
                            BusMeButton(
                              titleText: 'Restablecer contraseña',
                              padding: EdgeInsets.symmetric(vertical: 50.sp),
                              onPressed: _isButtonEnabled == true
                                  ? () { Navigator.of(context).pop(); }
                                  : () {},
                              backgroundColor: _isButtonEnabled
                                  ? AppColors.buttonColor
                                  : AppColors.disabledButtonColor,
                              textStyle: _isButtonEnabled 
                                  ? AppTextStyles.buttonText(context) 
                                  : AppTextStyles.disabledButtonText(context),
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
}
