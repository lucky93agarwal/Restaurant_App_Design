import 'package:flutter/material.dart';
import 'package:restaurant_app_design/model/best_offer.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/ui/widgets/custom_painter.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/app_text.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/font_utils.dart';
import 'package:restaurant_app_design/utils/images.dart';

class BestOfferScreen extends StatefulWidget {
  const BestOfferScreen({super.key});

  @override
  State<BestOfferScreen> createState() => _BestOfferScreenState();
}

class _BestOfferScreenState extends State<BestOfferScreen> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bgDarkColor,
      body: CustomPaint(
        painter: CustomPainterTwo(),
        child: ListView(
          controller: controller,
          padding: const EdgeInsets.all(0),
          children: [
            verticalSpacing(10),
            appBarTwoWidget(AppText.bestOffer, true),
            bestOfferWidget(context,controller),

          ],
        ),
      ),
    );
  }
}
