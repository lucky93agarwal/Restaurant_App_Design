import 'package:flutter/material.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/ui/widgets/custom_painter.dart';
import 'package:restaurant_app_design/ui/widgets/text_field.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/font_utils.dart';


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
  }
  void onTapForgotButton(){
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bgDarkColor,
      body: CustomPaint(
        painter: CustomPainterTwo(),
        child: ListView(
          children: [

            appBarWidget("Sign in"),
            verticalSpacing(20),
            titleWidget("Your Favourite Food from Nearby Top Restaurant"),
            verticalSpacing(20),
            AppTextField(
              ctrl: emailController,
                hintText: "Email",
                textInputType:TextInputType.emailAddress,
                icons:0
            ),
            verticalSpacing(10),
            AppTextField(
                ctrl: passController,
                hintText: "Password",
                textInputType:TextInputType.visiblePassword,
              onTap: onTapForgotButton,
            ),
            verticalSpacing(20),
            customButton("Sign in",context,onTapButton),
            verticalSpacing(240),
            customTextUnderLineButton("Sign Up",onTapMoveNextButton),
            verticalSpacing(40),
          ],
        ),
      ),
    );
  }
}
