// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class VerticalGap extends StatelessWidget {
  final double gap;
  const VerticalGap({this.gap = 10});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: gap,
    );
  }
}

class HorizontalGap extends StatelessWidget {
  final double gap;
  const HorizontalGap({this.gap = 10});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: gap,
    );
  }
}

Widget horizontalSpacing(double width) => SizedBox(
  width: width,
);
Widget verticalSpacing(double height) => SizedBox(
  height: height,
);

