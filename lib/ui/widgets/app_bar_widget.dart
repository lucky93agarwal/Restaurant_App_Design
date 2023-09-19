import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/model/category.dart';
import 'package:restaurant_app_design/model/nearby_best_restaurant.dart';
import 'package:restaurant_app_design/model/popular_food.dart';
import 'package:restaurant_app_design/model/recent_search.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/app_text.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/font_utils.dart';
import 'package:restaurant_app_design/utils/images.dart';

Widget appBarWidget(String title) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    margin: const EdgeInsets.symmetric(vertical: 10),
    alignment: Alignment.center,
    height: 80,
    child: Stack(
      children: [
        InkWell(
            onTap: () => Get.back(),
            child: const Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ))),
        Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: FontUtilities.h16(
                  fontColor: Colors.white, fontWeight: FWT.semiBold),
            )),
      ],
    ),
  );
}

Widget titleWidget(String title) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    margin: const EdgeInsets.symmetric(vertical: 10),
    alignment: Alignment.center,
    child: Text(
      title,
      textAlign: TextAlign.center,
      style:
          FontUtilities.h24(fontColor: Colors.white, fontWeight: FWT.semiBold),
    ),
  );
}

Widget subTitleWidget(String title) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    margin: const EdgeInsets.symmetric(vertical: 10),
    alignment: Alignment.center,
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: FontUtilities.h14(fontColor: Colors.white, fontWeight: FWT.medium),
    ),
  );
}

Widget userProfile(
    bool addBtn, BuildContext context, void Function() onTap, String userImg) {
  return InkWell(
    onTap: () {},
    child: SizedBox(
      height: 110,
      width: 110,
      child: Stack(
        children: [
          Container(
            height: 110,
            width: 110,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage(
                        userImg.isEmpty ? AppImages.userImg : userImg))),
          ),
          Visibility(
            visible: addBtn,
            child: Positioned(
              bottom: 3,
              right: 3,
              child: Container(
                height: 30,
                width: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    shape: BoxShape.circle,
                    color: Theme.of(context).buttonSec),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget subSecondTitleWidget(String title) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    margin: const EdgeInsets.symmetric(vertical: 10),
    alignment: Alignment.center,
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: FontUtilities.h15(fontColor: Colors.white, fontWeight: FWT.black),
    ),
  );
}

Widget menuCategory(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: List.generate(
              category.length,
              (index) => InkWell(
                    onTap: () {},
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).buttonSec,
                          shape: BoxShape.circle),
                      child: Image.asset(category[index].img),
                    ),
                  )),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: const BoxDecoration(
                color: Color(0xffff0188),
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Text(
              AppText.cuisine,
              style: FontUtilities.h14(
                  fontColor: Colors.white, fontWeight: FWT.semiBold),
            ),
          ),
        )
      ],
    ),
  );
}

Widget titleMenu(String firstTitle,String secondTitle){
  return  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(firstTitle,
        style: FontUtilities.h16(
            decorationColor: Colors.blue,
            fontColor: Colors.white,
            fontWeight: FWT.semiBold),
      ),
      Row(
        children: [
          Text(secondTitle,
            textAlign: TextAlign.center,
            style: FontUtilities.h12(
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
                fontColor: Colors.white,
                fontWeight: FWT.semiBold),
          ),
          const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 15,)
        ],
      )
    ],
  );
}
Widget popularFood() {
  return Container(
    margin: const EdgeInsets.only(left: 20),
    child: Column(
      children: [
        titleMenu(AppText.popularFood, AppText.allFood),

        verticalSpacing(20),
        SizedBox(
          height: 250,
          child: ListView.builder(
            shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: popular.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: 150,
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                              image: AssetImage(popular[index].img),
                              fit: BoxFit.cover)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height:30,
                            width: 30,
                            padding: const EdgeInsets.all(5),
                            decoration:const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Image.asset(AppImages.heartIcon),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: const BoxDecoration(
                                color: Color(0xffff0188),
                                borderRadius: BorderRadius.all(Radius.circular(25))),
                            child: Text(
                              popular[index].off,
                              style: FontUtilities.h11(
                                  fontColor: Colors.white, fontWeight: FWT.semiBold),
                            ),
                          )
                      ],),
                    ),
                    verticalSpacing(10),
                    Text(popular[index].title,
                      style: FontUtilities.h14(
                        decorationColor: Colors.blue,
                        fontColor: Colors.white,
                        fontWeight: FWT.semiBold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                     const Icon(Icons.star,color: Colors.yellow,size: 15,),
                        horizontalSpacing(5),
                        Text(popular[index].rating,
                          style: FontUtilities.h12(
                              decorationColor: Colors.blue,
                              fontColor: Colors.white,
                              fontWeight: FWT.semiBold),),
                        horizontalSpacing(5),
                        Text(popular[index].review,
                          style: FontUtilities.h12(
                              decorationColor: Colors.blue,
                              fontColor: Theme.of(context).subTitleText,
                              fontWeight: FWT.regular),),
                    ],)
                  ],
                );
              }),
        ),
      ],
    ),
  );
}

Widget nearbyRestaurantFood() {
  return Container(
    margin: const EdgeInsets.only(left: 20),
    child: Column(
      children: [
        titleMenu(AppText.nearbyBestRestaurant, AppText.all),

        verticalSpacing(20),
        SizedBox(
          height: 250,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: restaurant.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: 150,
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                              image: AssetImage(restaurant[index].img),
                              fit: BoxFit.cover)),
                    ),
                    verticalSpacing(10),
                    Text(restaurant[index].title,
                      style: FontUtilities.h14(
                          decorationColor: Colors.blue,
                          fontColor: Colors.white,
                          fontWeight: FWT.semiBold),),
                  ],
                );
              }),
        ),
      ],
    ),
  );
}

Widget resendSend(BuildContext context){
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppText.recentSearch,
          style: FontUtilities.h14(
            fontColor: Theme.of(context).subTitleText,),),
         verticalSpacing(10),
         Column(children: List.generate(recentSearch.length, (index) => Container(
           margin: const EdgeInsets.symmetric(vertical: 10),
           child: Row(children: [
             const Icon(Icons.access_time_filled_outlined,color: Color(0xffff0188),size: 20,),
             horizontalSpacing(10),
             Text(recentSearch[index].title,
               style: FontUtilities.h14(
                 decorationColor:Colors.white,
                 fontColor: Colors.white,),),
           ],),
         )),)

      ],
    ),);
}

Widget horizontalLine(BuildContext context){
  return Container(height: 1,
    width: Get.width,
    margin: const EdgeInsets.symmetric(horizontal: 20),
    color: Theme.of(context).subTitleText,);
}

Widget customTextUnderLineButton(String title, void Function() onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: FontUtilities.h16(
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
            fontColor: Colors.white,
            fontWeight: FWT.semiBold),
      ),
    ),
  );
}

Widget customButton(String title, BuildContext context, void Function() onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: const [0.4, 0.9],
            colors: [
              Theme.of(context).appMainLightColor,
              Theme.of(context).secondMainLightColor
            ],
          )),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: FontUtilities.h16(
            fontColor: Colors.white, fontWeight: FWT.semiBold),
      ),
    ),
  );
}
