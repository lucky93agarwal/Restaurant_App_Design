import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/ui/widgets/custom_painter.dart';
import 'package:restaurant_app_design/ui/widgets/text_field.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
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
                  appBarWidget("Sign Up"),
                  verticalSpacing(40),
                  verticalSpacing(20),
                  AppTextField(
                      ctrl: emailController,
                      hintText: "Email",
                      textInputType:TextInputType.emailAddress,
                      icons:0,
                      iconsTwo:2,
                      checkVerify:false
                  ),
                  verticalSpacing(10),
                  AppTextField(
                      ctrl: passController,
                      hintText: "Password",
                      textInputType:TextInputType.visiblePassword,
                      onTap: onTapForgotButton,
                      icons:3,
                      iconsTwo:2,
                      checkVerify:false
                  ),
                  verticalSpacing(10),
                  AppTextField(
                      ctrl: phoneController,
                      hintText: "Phone",
                      textInputType:TextInputType.visiblePassword,
                      onTap: onTapForgotButton,
                      icons:2,
                      iconsTwo:2,
                      checkVerify:false
                  ),
                  verticalSpacing(20),
                  customButton("Next",context,onTapButton),
                ],
              ),
            ),),

            customTextUnderLineButton("Sign In",onTapMoveNextButton),
            verticalSpacing(40),
          ],
        ),
      ),
    );
  }
}