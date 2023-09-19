import 'package:flutter/material.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/ui/widgets/custom_painter.dart';
import 'package:restaurant_app_design/ui/widgets/text_field.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/app_text.dart';
import 'package:restaurant_app_design/utils/color.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bgDarkColor,
      body: CustomPaint(
        painter: CustomPainterTwo(),
        child: ListView(children: [
          verticalSpacing(20),
          Row(
            children: [
              AppTextField(
                  ctrl: searchController,
                  hintText: AppText.search,
                  textInputType: TextInputType.name,
                  icons: AppText.searchPrefixIconEditText,
                  iconsTwo: AppText.filterIconTextSuffixIconEditText,
                  checkVerify: false,
                  searchEdit:1),
             const Icon(Icons.close,color: Colors.white,)
            ],
          ),
          verticalSpacing(20),
          resendSend(context),
        ],),
      ),
    );
  }
}
