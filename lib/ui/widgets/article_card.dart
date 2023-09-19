import 'package:flutter/material.dart';
import 'package:restaurant_app_design/model/database.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/app_text.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/font_utils.dart';


class ArticleCard extends StatelessWidget {
  final Article article;
  final int index;
  final double page;
  const ArticleCard({super.key,required this.article,
    required this.index,
    required this.page,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpacing(40),
        SizedBox(
          height: 300,
            child: Image.asset(article.image)),
        verticalSpacing(20),
        Text(article.title,
          style: FontUtilities.h18(
              fontColor: Colors.white, fontWeight: FWT.medium),
        ),
        verticalSpacing(10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            AppText.lorenIpsumIsSimplyDummyTestPrintingAndTypeSetting,
            textAlign: TextAlign.center,
            style: FontUtilities.h12(
                fontColor: Theme.of(context).subTitleText, fontWeight: FWT.regular),
          ),
        ),
        verticalSpacing(20),

      ],
    );
  }
}
