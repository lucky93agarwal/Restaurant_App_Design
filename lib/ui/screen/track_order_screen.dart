import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/controller/product_details_contoller.dart';
import 'package:restaurant_app_design/controller/track_order_controller.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/ui/widgets/custom_painter.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/app_text.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/font_utils.dart';
import 'package:restaurant_app_design/utils/route_path.dart';


class TrackOrderScreen extends GetView<TrackOrderController> {
  const TrackOrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bgDarkColor,
      body: CustomPaint(
        painter: CustomPainterTwo(),
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            verticalSpacing(10),
            appBarTwoWidget(AppText.trackOrder,true),

            verticalSpacing(50),
            trackOrderWidget(context),
            horizontalLine(context),
            verticalSpacing(10),
            preparingYourOrder(context,controller.controllerGoogle,controller.kGooglePlex)
        ],),
      ),
    );
  }
}
