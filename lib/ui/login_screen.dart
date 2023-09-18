import 'package:flutter/material.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/ui/widgets/custom_painter.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/font_utils.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void onTapButton(){
  }
  void onTapMoveNextButton(){
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bgDarkColor,
      body: CustomPaint(
        painter: CustomPainterTwo(),
        child: Column(
          children: [
            appBarWidget("Sign in"),
            verticalSpacing(20),
            titleWidget("Your Favourite Food from Nearby Top Restaurant"),
            customButton("Sign in",context,onTapButton),
            const Spacer(),
            customTextUnderLineButton("Sign Up",onTapMoveNextButton),
            verticalSpacing(40),
          ],
        ),
      ),
    );
  }
}
