import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/ui/widgets/custom_painter.dart';
import 'package:restaurant_app_design/ui/widgets/text_field.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/route_path.dart';

import '../../utils/app_text.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  void onTapButton(){
    Get.toNamed(RoutePath.verifyScreen);
  }
  void onTapMoveNextButton(){
    Get.toNamed(RoutePath.signupScreen);
  }
  void onTapForgotButton(){
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bgDarkColor,
      body: CustomPaint(
        painter: CustomPainterTwo(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpacing(20),
                  appBarWidget(AppText.forgotPassword,false),
                  verticalSpacing(20),
                  subTitleWidget(AppText.pleaseEnterYourEmailToResetYourPassword),
                  verticalSpacing(20),
                  AppTextField(
                      ctrl: emailController,
                      hintText: AppText.email,
                      textInputType:TextInputType.emailAddress,
                      icons: AppText.messageTextPrefixIconEditText,
                      iconsTwo:AppText.hideSuffixIconEditText,
                      checkVerify:false
                  ),
                  verticalSpacing(20),
                  customButton(AppText.sendNow,context,onTapButton),
                ],
              ),
            ),),

            customTextUnderLineButton(AppText.signUp,onTapMoveNextButton),
            verticalSpacing(40),
          ],
        ),
      ),
    );
  }
}
