import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/ui/widgets/custom_painter.dart';
import 'package:restaurant_app_design/ui/widgets/text_field.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/route_path.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  void onTapButton(){
  }
  void onTapMoveNextButton(){
    Get.toNamed(RoutePath.loginScreen);
  }
  void onTapForgotButton(){
    Get.toNamed(RoutePath.forgotScreen);
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
                  appBarWidget("Verification"),
                  verticalSpacing(20),
                  subTitleWidget("We've sent a verification code to"),
                  subSecondTitleWidget("RamSingh@gmail.com"),
                  verticalSpacing(20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppTextField(
                            ctrl: emailController,
                            hintText: "",
                            textInputType:TextInputType.number,
                            icons:4,
                            iconsTwo:2,
                            checkVerify:true
                        ),
                        AppTextField(
                            ctrl: emailController,
                            hintText: "",
                            textInputType:TextInputType.number,
                            icons:4,
                            iconsTwo:2,
                            checkVerify:true
                        ),
                        AppTextField(
                            ctrl: emailController,
                            hintText: "",
                            textInputType:TextInputType.number,
                            icons:4,
                            iconsTwo:2,
                            checkVerify:true
                        ),
                        AppTextField(
                            ctrl: emailController,
                            hintText: "",
                            textInputType:TextInputType.number,
                            icons:4,
                            iconsTwo:2,
                            checkVerify:true
                        ),
                      ],
                    ),
                  ),
                  verticalSpacing(20),
                  customButton("Verify",context,onTapButton),
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