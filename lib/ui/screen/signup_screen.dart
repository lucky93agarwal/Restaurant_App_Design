import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/ui/widgets/custom_painter.dart';
import 'package:restaurant_app_design/ui/widgets/text_field.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/app_text.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/route_path.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  void onTapButton(){
    Get.toNamed(RoutePath.verifyScreen);
  }
  void onTapMoveNextButton(){
    Get.back();
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
                  appBarWidget(AppText.signUp),
                  verticalSpacing(60),
                  AppTextField(
                      ctrl: emailController,
                      hintText: AppText.email,
                      textInputType:TextInputType.emailAddress,
                      icons: AppText.messageTextPrefixIconEditText,
                      iconsTwo:AppText.hideSuffixIconEditText,
                      checkVerify:false
                  ),
                  verticalSpacing(10),
                  AppTextField(
                      ctrl: passController,
                      hintText: AppText.password,
                      textInputType:TextInputType.visiblePassword,
                      onTap: onTapForgotButton,
                      icons: AppText.keyTextPrefixIconEditText,
                      iconsTwo:AppText.hideSuffixIconEditText,
                      checkVerify:false
                  ),
                  verticalSpacing(10),
                  AppTextField(
                      ctrl: phoneController,
                      hintText: AppText.phone,
                      textInputType:TextInputType.visiblePassword,
                      onTap: onTapForgotButton,
                      icons: AppText.phoneTextPrefixIconEditText,
                      iconsTwo:AppText.hideSuffixIconEditText,
                      checkVerify:false
                  ),
                  verticalSpacing(20),
                  customButton(AppText.next,context,onTapButton),
                ],
              ),
            ),),

            customTextUnderLineButton(AppText.signIn,onTapMoveNextButton),
            verticalSpacing(40),
          ],
        ),
      ),
    );
  }
}
