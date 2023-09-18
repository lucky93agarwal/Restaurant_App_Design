import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/ui/widgets/custom_painter.dart';
import 'package:restaurant_app_design/ui/widgets/text_field.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/route_path.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  void onTapButton(){
  }
  void onTapMoveNextButton(){
    Get.toNamed(RoutePath.signupScreen);
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpacing(20),
                    appBarWidget("Sign in"),
                    verticalSpacing(20),
                    titleWidget("Your Favourite Food from Nearby Top Restaurant"),
                    verticalSpacing(20),
                    AppTextField(
                        ctrl: emailController,
                        hintText: "Email",
                        textInputType:TextInputType.emailAddress,
                        icons:0,
                        iconsTwo:0,
                        checkVerify:false
                    ),
                    verticalSpacing(10),
                    AppTextField(
                        ctrl: passController,
                        hintText: "Password",
                        textInputType:TextInputType.visiblePassword,
                        onTap: onTapForgotButton,
                        icons:3,
                        checkVerify:false
                    ),
                    verticalSpacing(20),
                    customButton("Sign in",context,onTapButton),
                  ],
                ),
              ),
            ),
           

            customTextUnderLineButton("Sign Up",onTapMoveNextButton),
            verticalSpacing(40),
          ],
        ),
      ),
    );
  }
}
