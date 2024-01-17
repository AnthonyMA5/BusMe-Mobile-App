import 'package:busme/constants/sizes/app_dimensions.dart';
import 'package:busme/constants/paths/image_paths.dart';
import 'package:busme/constants/strings/text_strings.dart';
import 'package:busme/constants/styles/app_colors.dart';
import 'package:busme/constants/styles/app_text_styles.dart';
import 'package:busme/routes/app_routes.dart';
import 'package:busme/widgets/bm_text_field.dart';
import 'package:busme/widgets/bm_link_text.dart';
import 'package:busme/widgets/bm_button.dart';
import 'package:fui_kit/fui_kit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isPasswordVisible = true;

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
                padding: EdgeInsets.all(25.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40.sp,
                      height: 40.sp,
                      margin: EdgeInsets.only(bottom: 10.sp),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(ImagePaths.appLogo),
                        fit: BoxFit.cover,
                      )),
                    ),
                    Text(
                      TextStrings.loginTitle,
                      style: AppTextStyles.titleText(context),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Text(
                      TextStrings.loginSubtitle,
                      style: AppTextStyles.subtitleText(context),
                    ),
                    SizedBox(
                      height: 45.sp,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          BusMeTextField(
                              labelText: TextStrings.emailTitle,
                              hintText: TextStrings.emailHintText,
                              keyboardType: TextInputType.emailAddress,
                              validator: (String? input) {
                                if (input == null || input.isEmpty) {
                                  return 'Por favor, ingrese un valor válido.';
                                }
                                return null;
                              },
                              controller: _emailController,
                          ),
                          SizedBox(height: 25.sp,),
                          BusMeTextField(
                              labelText: TextStrings.passwordTitle,
                              hintText: TextStrings.passwordHintText,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: isPasswordVisible,
                              showIcon: true,
                              icon: isPasswordVisible ? FUIcons.regularRounded.eye : FUIcons.regularRounded.eyeCrossed,
                              validator: (String? input) {
                                if (input == null || input.isEmpty) {
                                  return 'Por favor, ingrese un valor válido.';
                                }
                                return null;
                              },
                              controller: _passwordController,
                              onIconTap: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    BusMeLinkText(
                      text: TextStrings.forgotPasswordTitle,
                      alignment: Alignment.centerRight,
                      onTap: (){
                        Navigator.pushNamed(context, ROUTE_FORGOT_PASSWORD);
                      },
                    ),
                    BusMeButton(
                        titleText: TextStrings.signIn,
                        padding: EdgeInsets.symmetric(vertical: 50.sp),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamedAndRemoveUntil(context, ROUTE_MAIN, (route) => false);
                          }
                        },
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        TextStrings.signUpQuestion,
                        style: AppTextStyles.boldContentText(context),
                      ),
                    ),
                    BusMeLinkText(
                        text: TextStrings.signUpLink,
                        alignment: Alignment.center,
                        onTap: (){
                          Navigator.pushNamedAndRemoveUntil(context, ROUTE_REGISTER, (route) => false);
                        },
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
