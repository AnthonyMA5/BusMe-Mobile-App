import 'package:flutter/material.dart';
import 'package:busme/constants/styles/app_text_styles.dart';
import 'package:busme/constants/styles/app_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:busme/widgets/bm_link_text.dart';
import 'package:busme/widgets/bm_text_field.dart';
import 'package:busme/widgets/bm_button.dart';
import 'package:busme/constants/strings/image_strings.dart';
import 'package:busme/constants/strings/text_strings.dart';
import 'package:busme/routes/app_routes.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool? _isChecked = false;

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
                                image: AssetImage(ImageStrings.appLogo),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Text(
                          TextStrings.registerTitle,
                          style: AppTextStyles.titleText(context),
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        Text(
                          TextStrings.registerSubtitle,
                          style: AppTextStyles.subtitleText(context),
                        ),
                        SizedBox(
                          height: 30.sp,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              BusMeTextField(
                                labelText: TextStrings.nameTitle,
                                hintText: TextStrings.nameHintText,
                                keyboardType: TextInputType.name,
                                validator: (String? input) {
                                  if (input == null || input.isEmpty) {
                                    return 'Por favor, ingrese un valor válido.';
                                  }
                                  return null;
                                },
                                controller: _emailController,
                              ),
                              SizedBox(height: 20.sp,),
                              BusMeTextField(
                                labelText: TextStrings.fathersLastNameTitle,
                                hintText: TextStrings.fathersLastNameHintText,
                                keyboardType: TextInputType.text,
                                validator: (String? input) {
                                  if (input == null || input.isEmpty) {
                                    return 'Por favor, ingrese un valor válido.';
                                  }
                                  return null;
                                },
                                controller: _passwordController,
                              ),
                              SizedBox(height: 20.sp,),
                              BusMeTextField(
                                labelText: TextStrings.mothersLastNameTitle,
                                hintText: TextStrings.mothersLastNameHintText,
                                keyboardType: TextInputType.text,
                                validator: (String? input) {
                                  if (input == null || input.isEmpty) {
                                    return 'Por favor, ingrese un valor válido.';
                                  }
                                  return null;
                                },
                                controller: _passwordController,
                              ),
                              SizedBox(height: 20.sp,),
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
                                controller: _passwordController,
                              ),
                              SizedBox(height: 20.sp,),
                              BusMeTextField(
                                labelText: TextStrings.passwordTitle,
                                hintText: TextStrings.passwordHintText,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (String? input) {
                                  if (input == null || input.isEmpty) {
                                    return 'Por favor, ingrese un valor válido.';
                                  }
                                  return null;
                                },
                                controller: _passwordController,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 24.sp,
                              height: 24.sp,
                              child: Transform.scale(
                                scale: 0.75.sp,
                                child: Checkbox(
                                  value: _isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isChecked = value!;
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      SizerUtil.deviceType ==
                                          DeviceType.mobile
                                          ? 4.sp
                                          : 1.5.sp,
                                    ),
                                  ),
                                  fillColor: MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                      if (states.contains(
                                          MaterialState.selected)) {
                                        return AppColors.selectCheckboxColor;
                                      }
                                      return AppColors.unselectCheckboxColor;
                                    },
                                  ),
                                  side: BorderSide(
                                    color: Colors.grey,
                                    width: 1.2,
                                  ),
                                  visualDensity:
                                  VisualDensity.comfortable,
                                ),
                              ),
                            ),
                            Text(
                              'Acepto los',
                              style:
                              AppTextStyles.contentText(context),
                            ),
                            SizedBox(width: 5.sp,),
                            BusMeLinkText(
                              text: 'Términos y Condiciones',
                              alignment: Alignment.centerLeft,
                              onTap: (){},
                            ),
                          ],
                        ),
                        BusMeButton(
                          titleText: TextStrings.signUp,
                          padding: EdgeInsets.symmetric(vertical: 30.sp),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamedAndRemoveUntil(context, ROUTE_MAIN, (route) => false);
                            }
                          },
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            TextStrings.signInQuestion,
                            style: AppTextStyles.boldContentText(context),
                          ),
                        ),
                        BusMeLinkText(
                          text: TextStrings.signInLink,
                          alignment: Alignment.center,
                          onTap: (){
                            Navigator.pop(context, ROUTE_LOGIN);
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
