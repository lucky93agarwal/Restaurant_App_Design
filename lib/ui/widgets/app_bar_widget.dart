import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_app_design/controller/filter_controller.dart';
import 'package:restaurant_app_design/controller/product_details_contoller.dart';
import 'package:restaurant_app_design/controller/restaurant_booking_controller.dart';
import 'package:restaurant_app_design/model/best_offer.dart';
import 'package:restaurant_app_design/model/category.dart';
import 'package:restaurant_app_design/model/filter_list.dart';
import 'package:restaurant_app_design/model/nearby_best_restaurant.dart';
import 'package:restaurant_app_design/model/popular_food.dart';
import 'package:restaurant_app_design/model/recent_search.dart';
import 'package:restaurant_app_design/model/sort_list.dart';
import 'package:restaurant_app_design/ui/screen/product_details_screen.dart';
import 'package:restaurant_app_design/ui/widgets/text_field.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/app_text.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/font_utils.dart';
import 'package:restaurant_app_design/utils/images.dart';
import 'package:restaurant_app_design/utils/route_path.dart';
import 'package:restaurant_app_design/utils/utility.dart';

Widget appBarWidget(String title, bool rightIcon) {
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
        Visibility(
          visible: rightIcon == null ? false : true,
          child: const Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.search,
                color: Colors.white,
              )),
        ),
      ],
    ),
  );
}

Widget trackOrderWidget(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "McDonald's",
          style: FontUtilities.h16(
              fontColor: Colors.white, fontWeight: FWT.semiBold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "4:45 pm",
              style: FontUtilities.h30(
                  fontColor: Colors.white, fontWeight: FWT.semiBold),
            ),
            Text(
              AppText.estimateArrival,
              style: FontUtilities.h15(
                  fontColor: Colors.white, fontWeight: FWT.semiBold),
            ),
          ],
        ),
        verticalSpacing(20),
      ],
    ),
  );
}

Widget preparingYourOrder(
    BuildContext context,
    Completer<GoogleMapController> controllerGoogle,
    CameraPosition kGooglePlex) {
  return Container(
    height: Get.height * 0.75,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppText.preparingYourOrder,
              style: FontUtilities.h14(
                  fontColor: Colors.white, fontWeight: FWT.semiBold),
            ),
            horizontalSpacing(10),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Colors.white,
            )
          ],
        ),
        verticalSpacing(10),
        Expanded(
            flex: 1,
            child: Container(
                color: Colors.yellow,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    controllerGoogle.complete(controller);
                  },
                )))
      ],
    ),
  );
}

Widget restaurantBookingDateWidget(BuildContext context, int type, Function(String) onTabTime,String time,
    void Function() onTabPlus,void Function() onTabMinus, int person,
    TextEditingController emailController,
    TextEditingController firstNameController,
    TextEditingController lastNameController,
    TextEditingController phoneController) {
  return Column(
    children: [
      appBarTwoWidget(
          type == 1
              ? AppText.selectDate
              : type == 2
                  ? AppText.selectTime
                  : type == 3
                      ? AppText.selectPerson
                      : AppText.yourInformation,
          true),
      verticalSpacing(20),
      restaurantSelect(type,context,time,person),
      verticalSpacing(50),
      Visibility(visible: type == 2?true:false,child: restaurantTime(context,onTabTime,time)),
      Visibility(visible: type == 3?true:false,child: restaurantPerson(context,onTabPlus,onTabMinus,person)),

      Visibility(visible: type == 4?true:false,child: restaurantYourInfoWidget(context,
          emailController,firstNameController,lastNameController,phoneController),),
    ],
  );
}

Widget restaurantYourInfoWidget(BuildContext context,
    TextEditingController emailController,
    TextEditingController firstNameController,
    TextEditingController lastNameController,
    TextEditingController phoneController){
  return Container(margin: const EdgeInsets.symmetric(horizontal: 0),
  child: Column(children: [
    AppTextField(
        ctrl: emailController,
        hintText: AppText.email,
        textInputType:TextInputType.emailAddress,
        icons: AppText.messageTextPrefixIconEditText,
        iconsTwo: AppText.hideSuffixIconEditText,
        checkVerify:false
    ),
    verticalSpacing(10),
    AppTextField(
        ctrl: firstNameController,
        hintText: AppText.firstName,
        textInputType:TextInputType.visiblePassword,
        icons: AppText.userTextPrefixIconEditText,
        iconsTwo: AppText.hideSuffixIconEditText,
        checkVerify:false
    ),
    verticalSpacing(10),
    AppTextField(
        ctrl: lastNameController,
        hintText: AppText.lastName,
        textInputType:TextInputType.emailAddress,
        icons: AppText.userTextPrefixIconEditText,
        iconsTwo: AppText.hideSuffixIconEditText,
        checkVerify:false
    ),
    verticalSpacing(10),
    AppTextField(
        ctrl: phoneController,
        hintText: AppText.phone,
        textInputType:TextInputType.visiblePassword,
        icons: AppText.phoneTextPrefixIconEditText,
        iconsTwo: AppText.hideSuffixIconEditText,
        checkVerify:false
    ),
  ],),);
}

Widget restaurantPerson(BuildContext context, void Function() onTabPlus,void Function() onTabMinus,int person){

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           const Icon(
              Icons.arrow_back,
              color: Colors.transparent,
            ),
            Text(
              AppText.person,
              style: FontUtilities.h16(
                  fontColor: Colors.white, fontWeight: FWT.semiBold),
            ),
            const  Icon(
              Icons.arrow_forward,
              color: Colors.transparent,
            ),
          ],
        ),
        verticalSpacing(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(onTap: onTabMinus,child: Container(width: 15,height: 2,color: Colors.white,)),

            personButton(context,person),

            InkWell(
              onTap: onTabPlus,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(width: 15,height: 2,color: Colors.white,),
                  Container(width: 2,height: 15,color: Colors.white,),
                ],),
            ),





          ],)
      ],
    ),
  );
}

Widget restaurantTime(BuildContext context,  Function(String) onTab,String time) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            Text(
              AppText.breakfast,
              style: FontUtilities.h16(
                  fontColor: Colors.white, fontWeight: FWT.semiBold),
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ],
        ),
        verticalSpacing(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            timeButton("7:30",onTab,context,time),

            timeButton("8:30",onTab,context,time),
            timeButton("9:00",onTab,context,time),



        ],)
      ],
    ),
  );
}

Widget personButton(BuildContext context,int personLocal){
  return Container(
    width: 75,
    alignment: Alignment.center,
    margin: const EdgeInsets.symmetric(horizontal: 20),
    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color:Theme.of(context).boxTitle
    ),
    child:  Text(personLocal.toString(), style: FontUtilities.h14(
        fontColor: Colors.white, fontWeight: FWT.semiBold),),
  );
}
Widget timeButton(String time, Function(String) onTab, BuildContext context,String timeLocal){
  int i=0;
  return InkWell(
    onTap: (){
      cPrint("time -"+time);
      i=1;
      onTab(time);
    },
    child: Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color:timeLocal==time? Theme.of(context).boxSelectTitle: Theme.of(context).boxTitle
      ),
      child: Text(time, style: FontUtilities.h14(
          fontColor: Colors.white, fontWeight: FWT.semiBold),),
    ),
  );
}



Widget restaurantSelect(int type,BuildContext context,String time,int person) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        type == 1 ? restaurantObx(1, 1, "",context) : restaurantObx(2, 1, "16 June",context),
        type == 1
            ? restaurantObx(1, 2, "",context)
            : type == 2
                ? restaurantObx(1, 2, "",context)
                : restaurantObx(2, 2, time,context),
        type == 1
            ? restaurantObx(1, 3, "",context)
            : type == 2
                ? restaurantObx(1, 3, "",context)
                : type == 3
                    ? restaurantObx(1, 3, "",context)
                    : restaurantObx(2, 3, person.toString()+" Pers.",context),
      ],
    ),
  );
}

Widget restaurantObx(int type, int icon, String data,BuildContext context) {
  return Container(
    width: 100,
    height: 100,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: type == 1 ? Theme.of(context).boxTitle : Theme.of(context).boxSelectTitle,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color:
                  type == 1 ? const Color(0xff7c608e) : const Color(0xfffa3ba6),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon == 1
                  ? Icons.calendar_month
                  : icon == 2
                      ? Icons.access_time_filled_outlined
                      : Icons.person,
              color: Colors.white,
              size: 20,
            )),
        verticalSpacing(5),
        Visibility(
          visible: data == "" ? false : true,
          replacement: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) => centerContainer()),
          ),
          child: Text(
            data,
            style: FontUtilities.h14(
                fontColor: Colors.white, fontWeight: FWT.semiBold),
          ),
        ),
      ],
    ),
  );
}

Widget centerContainer() {
  return Container(
    width: 4,
    height: 4,
    margin: const EdgeInsets.symmetric(horizontal: 2),
    decoration:
        const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
  );
}

Widget appBarTwoWidget(String title, bool rightIcon) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    margin: const EdgeInsets.only(top: 40),
    alignment: Alignment.center,
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
        Visibility(
          visible: rightIcon == null ? false : true,
          child: const Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.search,
                color: Colors.white,
              )),
        ),
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
                    onTap: () {
                      Get.toNamed(RoutePath.bestOffer);
                    },
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
          onTap: () {
            Get.toNamed(RoutePath.favourite);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                color: Theme.of(context).btnOffColor,
                borderRadius: const BorderRadius.all(Radius.circular(25))),
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

Widget favouriteFoodWidget(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(left: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppText.myFavouriteFood,
          style: FontUtilities.h16(
              fontColor: Colors.white, fontWeight: FWT.semiBold),
        ),
        verticalSpacing(15),
        SizedBox(
          width: Get.width,
          height: 205,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: bestOfferList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.only(left: 10, bottom: 10),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          image: DecorationImage(
                              image: AssetImage(bestOfferList[index].img),
                              fit: BoxFit.cover)),
                      child: Container(
                        height: 30,
                        width: 30,
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Image.asset(AppImages.heartIcon),
                      ),
                    ),
                    verticalSpacing(10),
                    Text(
                      bestOfferList[index].title,
                      style: FontUtilities.h16(
                          decorationColor: Colors.blue,
                          fontColor: Colors.white,
                          fontWeight: FWT.semiBold),
                    ),
                    verticalSpacing(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                        horizontalSpacing(5),
                        Text(
                          bestOfferList[index].rating,
                          style: FontUtilities.h12(
                              decorationColor: Colors.blue,
                              fontColor: Colors.white,
                              fontWeight: FWT.semiBold),
                        ),
                        horizontalSpacing(5),
                        Text(
                          bestOfferList[index].review,
                          style: FontUtilities.h12(
                              decorationColor: Colors.blue,
                              fontColor: const Color(0xff89749c),
                              fontWeight: FWT.regular),
                        ),
                      ],
                    ),
                  ],
                );
              }),
        ),
      ],
    ),
  );
}

Widget favouriteRestaurantWidget(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(left: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppText.myFavouriteRestaurant,
          style: FontUtilities.h16(
              fontColor: Colors.white, fontWeight: FWT.semiBold),
        ),
        verticalSpacing(15),
        SizedBox(
          width: Get.width,
          height: 190,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: restaurant.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.only(left: 10, bottom: 10),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          image: DecorationImage(
                              image: AssetImage(restaurant[index].img),
                              fit: BoxFit.cover)),
                      child: Container(
                        height: 30,
                        width: 30,
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Image.asset(AppImages.heartIcon),
                      ),
                    ),
                    verticalSpacing(10),
                    Text(
                      restaurant[index].title,
                      style: FontUtilities.h16(
                          decorationColor: Colors.blue,
                          fontColor: Colors.white,
                          fontWeight: FWT.semiBold),
                    ),
                    verticalSpacing(5),
                  ],
                );
              }),
        ),
      ],
    ),
  );
}

Widget titleMenu(
    String firstTitle, String secondTitle, dynamic model, Color color) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(
        firstTitle,
        style: FontUtilities.h16(
            decorationColor: Colors.blue,
            fontColor: Colors.white,
            fontWeight: FWT.semiBold),
      ),
      InkWell(
        onTap: () {
          if (model == AppText.addCard) {
            Get.toNamed(RoutePath.addCard);
          } else {
            var data = {"title": firstTitle, "model": model};
            Get.toNamed(RoutePath.listScreen, arguments: data);
          }
        },
        child: Row(
          children: [
            Text(
              secondTitle,
              textAlign: TextAlign.center,
              style: FontUtilities.h12(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                  fontColor: color,
                  fontWeight: FWT.semiBold),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: color,
              size: 15,
            )
          ],
        ),
      )
    ],
  );
}

Widget titleFilter(
    String firstTitle, String secondTitle, BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          firstTitle + secondTitle,
          style: FontUtilities.h16(
              decorationColor: Colors.blue,
              fontColor: Colors.white,
              fontWeight: FWT.semiBold),
        ),
        InkWell(
          onTap: () {
            Get.lazyPut(() => FilterController());
            var data = {
              "title": secondTitle,
            };
            Get.toNamed(RoutePath.filterScreen, arguments: data);
          },
          child: filterIcon(context),
        )
      ],
    ),
  );
}

Widget filterIcon(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 4,
        width: 18,
        margin: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: Theme.of(context).btnOffColor,
        ),
      ),
      Container(
        height: 4,
        width: 13,
        margin: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: Theme.of(context).btnOffColor,
        ),
      ),
      Container(
        height: 4,
        width: 7,
        margin: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: Theme.of(context).btnOffColor,
        ),
      ),
    ],
  );
}

Widget listFood(
    BuildContext context, dynamic model, ScrollController controller) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
    child: ListView.builder(
        padding: const EdgeInsets.all(0),
        controller: controller,
        itemCount: model.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: Get.width,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        image: AssetImage(model[index].img),
                        fit: BoxFit.cover)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        model[index].title,
                        style: FontUtilities.h14(
                            decorationColor: Colors.blue,
                            fontColor: Colors.white,
                            fontWeight: FWT.semiBold),
                      ),
                      Visibility(
                        visible: model[index].price.length > 0 ? true : false,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15,
                            ),
                            horizontalSpacing(5),
                            Text(
                              model[index].rating,
                              style: FontUtilities.h12(
                                  decorationColor: Colors.blue,
                                  fontColor: Colors.white,
                                  fontWeight: FWT.semiBold),
                            ),
                            horizontalSpacing(5),
                            Text(
                              model[index].review,
                              style: FontUtilities.h12(
                                  decorationColor: Colors.blue,
                                  fontColor: Theme.of(context).subTitleText,
                                  fontWeight: FWT.regular),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Visibility(
                    visible: model[index].price.length > 0 ? true : false,
                    child: Text(
                      model[index].price,
                      style: FontUtilities.h26(
                          fontColor: Colors.white, fontWeight: FWT.semiBold),
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
  );
}

Widget productBigImg(BuildContext context, Popular popular) {
  return Container(
    height: 250,
    width: Get.width,
    alignment: Alignment.bottomCenter,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      image: DecorationImage(
        image: AssetImage(popular.img),
        fit: BoxFit.cover,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 30,
          width: 30,
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Image.asset(AppImages.heartIcon),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: Theme.of(context).btnOffColor,
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          child: Text(
            popular.off,
            style: FontUtilities.h11(
                fontColor: Colors.white, fontWeight: FWT.semiBold),
          ),
        )
      ],
    ),
  );
}

Widget productBigTitle(BuildContext context, Popular popular) {
  return Container(
    width: Get.width,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                popular.fullName,
                style: FontUtilities.h24(
                    fontColor: Colors.white, fontWeight: FWT.regular),
              ),
            ),
            Text(
              popular.price,
              style: FontUtilities.h30(
                  fontColor: Colors.white, fontWeight: FWT.semiBold),
            ),
          ],
        ),
        verticalSpacing(10),
        Text(
          popular.cal,
          style: FontUtilities.h14(
              fontColor: Colors.white, fontWeight: FWT.semiBold),
        ),
        verticalSpacing(20),
        horizontalLineTwo(context),
        verticalSpacing(20),
        Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 15,
                ),
                horizontalSpacing(5),
                Text(
                  popular.rating,
                  style: FontUtilities.h12(
                      decorationColor: Colors.blue,
                      fontColor: Colors.white,
                      fontWeight: FWT.semiBold),
                ),
                horizontalSpacing(5),
                Text(
                  popular.review,
                  style: FontUtilities.h12(
                      decorationColor: Colors.blue,
                      fontColor: const Color(0xff89749c),
                      fontWeight: FWT.regular),
                ),
              ],
            ),
            const Spacer(),
            Text(
              "Food   ",
              style: FontUtilities.h12(
                  decorationColor: Colors.blue,
                  fontColor: Colors.white,
                  fontWeight: FWT.semiBold),
            ),
            Text(
              popular.brand,
              style: FontUtilities.h12(
                  decorationColor: Colors.blue,
                  decoration: TextDecoration.underline,
                  fontColor: Colors.white,
                  fontWeight: FWT.semiBold),
            ),
          ],
        ),
        verticalSpacing(20),
        horizontalLineTwo(context),
        verticalSpacing(20),
        Text(
          popular.details,
          style: FontUtilities.h12(
              decorationColor: Colors.blue,
              fontColor: const Color(0xff89749c),
              fontWeight: FWT.regular),
        ),
      ],
    ),
  );
}

Widget bottomSheetThanks(BuildContext context, void Function() onTapButton) {
  return GetBuilder<ProductDetailsController>(
      builder: (controller) => Container(
            height: Get.height * 0.4,
            width: Get.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                verticalSpacing(30),
                Container(
                  height: 60,
                  width: 60,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff42d584),
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
                verticalSpacing(40),
                Text(
                  AppText.thankYouForYourOrder,
                  textAlign: TextAlign.center,
                  style: FontUtilities.h30(
                      fontColor: Colors.black, fontWeight: FWT.black),
                ),
                verticalSpacing(40),
                customButton(AppText.trackYourOrder, context, onTapButton),
              ],
            ),
          ));
}

Widget bottomSheet(BuildContext context, void Function() onMinusTap,
    void Function() onPlusTap, void Function() onTapButton) {
  return GetBuilder<ProductDetailsController>(
      builder: (controller) => Obx(() => Container(
            height: Get.height * 0.4,
            width: Get.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                verticalSpacing(20),
                Text(
                  AppText.quantity,
                  style: FontUtilities.h16(
                      decorationColor: Colors.blue,
                      fontColor: Colors.black,
                      fontWeight: FWT.semiBold),
                ),
                verticalSpacing(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    minusButton(context, onMinusTap),
                    horizontalSpacing(20),
                    Text(
                      controller.quantity.value.toString(),
                      style: FontUtilities.h40(
                          fontColor: Colors.black, fontWeight: FWT.semiBold),
                    ),
                    horizontalSpacing(20),
                    plusButton(context, onPlusTap),
                  ],
                ),
                verticalSpacing(40),
                Text(
                  AppText.totalPrice,
                  style: FontUtilities.h12(
                      fontColor: Colors.black, fontWeight: FWT.semiBold),
                ),
                Text(
                  "\$" + controller.prince.value.toString(),
                  style: FontUtilities.h26(
                      fontColor: Colors.black, fontWeight: FWT.semiBold),
                ),
                verticalSpacing(10),
                customButton(AppText.continues, context, onTapButton),
              ],
            ),
          )));
}

Widget plusButton(BuildContext context, void Function() onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 50,
      width: 50,
      padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Color(0xfffff2fb)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 30,
              width: 5,
              decoration: BoxDecoration(
                  color: Theme.of(context).btnOffColor,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 5,
              width: 30,
              decoration: BoxDecoration(
                  color: Theme.of(context).btnOffColor,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget minusButton(BuildContext context, void Function() onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 50,
      width: 50,
      padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Color(0xfffff2fb)),
      child: Container(
        height: 5,
        width: 30,
        decoration: BoxDecoration(
            color: Theme.of(context).btnOffColor,
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
    ),
  );
}

Widget bestOfferWidget(BuildContext context, ScrollController controller) {
  return Container(
    padding: const EdgeInsets.all(0),
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: GridView.count(
      controller: controller,
      crossAxisCount: 2,
      crossAxisSpacing: 15.0,
      mainAxisSpacing: 20.0,
      shrinkWrap: true,
      children: List.generate(
        bestOfferList.length,
        (index) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                    image: AssetImage(bestOfferList[index].img),
                    fit: BoxFit.cover),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset(AppImages.heartIcon),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).btnOffColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25))),
                    child: Text(
                      bestOfferList[index].off,
                      style: FontUtilities.h11(
                          fontColor: Colors.white, fontWeight: FWT.semiBold),
                    ),
                  )
                ],
              ),
            ),
            verticalSpacing(10),
            Text(
              bestOfferList[index].title,
              style: FontUtilities.h14(
                  fontColor: Colors.white, fontWeight: FWT.regular),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget orderSummaryWidget(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 60,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  horizontalSpacing(10),
                  Image.asset(
                    AppImages.samosaImg,
                    width: 60,
                  ),
                  horizontalSpacing(10),
                  SizedBox(
                    width: 150,
                    child: Expanded(
                      child: Text(
                        popular[1].fullName,
                        style: FontUtilities.h16(
                            fontColor: Colors.black, fontWeight: FWT.semiBold),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 85,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$18",
                      style: FontUtilities.h18(
                          fontColor: Colors.black, fontWeight: FWT.black),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 29,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color(0xfffed9ef),
                            borderRadius:
                                BorderRadius.only(topRight: Radius.circular(5)),
                          ),
                          child: const Icon(
                            Icons.delete,
                            color: Color(0xffff0087),
                          ),
                        ),
                        Container(
                          height: 29,
                          width: 40,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color(0xfffed9ef),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5)),
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Color(0xffff0087),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        verticalSpacing(30),
        Text(
          popular[1].brand,
          style: FontUtilities.h16(
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
              fontColor: Colors.white,
              fontWeight: FWT.semiBold),
        ),
        Text(
          AppText.fullAddressFake,
          style: FontUtilities.h10(
              fontColor: Colors.white, fontWeight: FWT.regular),
        ),
      ],
    ),
  );
}

Widget popularFood() {
  return Container(
    margin: const EdgeInsets.only(left: 20),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: titleMenu(
              AppText.popularFood, AppText.allFood, popular, Colors.white),
        ),
        verticalSpacing(20),
        SizedBox(
          height: 250,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: popular.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.lazyPut(() => ProductDetailsController());
                    var data = {
                      "model": popular[index],
                    };
                    Get.toNamed(RoutePath.productDetails, arguments: data);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: 150,
                        alignment: Alignment.bottomCenter,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage(popular[index].img),
                                fit: BoxFit.cover)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Image.asset(AppImages.heartIcon),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).btnOffColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25))),
                              child: Text(
                                popular[index].off,
                                style: FontUtilities.h11(
                                    fontColor: Colors.white,
                                    fontWeight: FWT.semiBold),
                              ),
                            )
                          ],
                        ),
                      ),
                      verticalSpacing(10),
                      Text(
                        popular[index].title,
                        style: FontUtilities.h14(
                            decorationColor: Colors.blue,
                            fontColor: Colors.white,
                            fontWeight: FWT.semiBold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                          horizontalSpacing(5),
                          Text(
                            popular[index].rating,
                            style: FontUtilities.h12(
                                decorationColor: Colors.blue,
                                fontColor: Colors.white,
                                fontWeight: FWT.semiBold),
                          ),
                          horizontalSpacing(5),
                          Text(
                            popular[index].review,
                            style: FontUtilities.h12(
                                decorationColor: Colors.blue,
                                fontColor: Theme.of(context).subTitleText,
                                fontWeight: FWT.regular),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
    ),
  );
}

Widget paymentDelivery(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleMenu(AppText.deliveryAddress, AppText.change, AppText.change,
            const Color(0xffb40572)),
        verticalSpacing(10),
        Text(
          AppText.fullAddressFake,
          style: FontUtilities.h10(
              fontColor: Theme.of(context).subTextTitle,
              fontWeight: FWT.regular),
        ),
      ],
    ),
  );
}

Widget paymentMethod(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        titleMenu(AppText.paymentMethod, AppText.addCard, AppText.addCard,
            const Color(0xffb40572)),
        verticalSpacing(20),
        Container(
          height: 55,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
              color: Color(0xff2394bc),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AppImages.visaIcon,
                width: 50,
              ),
              Text(
                "*** **** **** 1234",
                style: FontUtilities.h14(
                    fontColor: Colors.white, fontWeight: FWT.black),
              ),
              const Icon(
                Icons.check,
                color: Colors.white,
              ),
            ],
          ),
        ),
        verticalSpacing(20),
        Container(
          height: 55,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: const Color(0xff4e247e), width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AppImages.paypalImg,
                width: 50,
                height: 30,
              ),
              Text(
                "*** **** **** 5789",
                style: FontUtilities.h14(
                    fontColor: Colors.white, fontWeight: FWT.black),
              ),
              const Icon(
                Icons.check,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget promoCodeSubTotalWidget(int price) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppText.subTotal,
              style: FontUtilities.h14(
                  fontColor: const Color(0xffb9aeca), fontWeight: FWT.semiBold),
            ),
            Text(
              "\$" + price.toString(),
              style: FontUtilities.h14(
                  fontColor: const Color(0xffb9aeca), fontWeight: FWT.semiBold),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppText.delivery,
              style: FontUtilities.h14(
                  fontColor: const Color(0xffb9aeca), fontWeight: FWT.semiBold),
            ),
            Text(
              "\$0.60",
              style: FontUtilities.h14(
                  fontColor: const Color(0xffb9aeca), fontWeight: FWT.semiBold),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppText.total,
              style: FontUtilities.h22(
                  fontColor: Colors.white, fontWeight: FWT.black),
            ),
            Text(
              "\$" + (price + 0.60).toString(),
              style: FontUtilities.h22(
                  fontColor: Colors.white, fontWeight: FWT.black),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget addCardFormWidget(
    BuildContext context, TextEditingController emailController) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppText.cardNumber,
          style: FontUtilities.h16(
              fontColor: Colors.white, fontWeight: FWT.semiBold),
        ),
        verticalSpacing(10),
        AppTextField(
          ctrl: emailController,
          hintText: "1234 1234 1234 1234",
          textInputType: TextInputType.emailAddress,
          icons: AppText.hideSuffixIconEditText,
          iconsTwo: AppText.hidePrefixIconEditText,
          checkVerify: true,
          checkPayment: true,
        ),
        verticalSpacing(30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppText.expDate,
                  style: FontUtilities.h16(
                      fontColor: Colors.white, fontWeight: FWT.semiBold),
                ),
                verticalSpacing(10),
                AppTextField(
                  ctrl: emailController,
                  hintText: AppText.mmYY,
                  textInputType: TextInputType.emailAddress,
                  icons: AppText.hideSuffixIconEditText,
                  iconsTwo: AppText.hidePrefixIconEditText,
                  checkVerify: true,
                  checkPayment: true,
                  checkRow: true,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppText.cvc,
                  style: FontUtilities.h16(
                      fontColor: Colors.white, fontWeight: FWT.semiBold),
                ),
                verticalSpacing(10),
                AppTextField(
                  ctrl: emailController,
                  hintText: AppText.mmYY,
                  textInputType: TextInputType.emailAddress,
                  icons: AppText.hideSuffixIconEditText,
                  iconsTwo: AppText.hidePrefixIconEditText,
                  checkVerify: true,
                  checkPayment: true,
                  checkRow: true,
                ),
              ],
            ),
          ],
        ),
        verticalSpacing(30),
        Text(
          AppText.country,
          style: FontUtilities.h16(
              fontColor: Colors.white, fontWeight: FWT.semiBold),
        ),
        verticalSpacing(10),
        AppTextField(
          ctrl: emailController,
          hintText: "United State of America",
          textInputType: TextInputType.emailAddress,
          icons: AppText.locationTextPrefixIconEditText,
          iconsTwo: AppText.arrowDownSuffixIconEditText,
          checkVerify: true,
          checkPayment: true,
        ),
      ],
    ),
  );
}

Widget promoCodeTitleWidget() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 30),
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppText.enterPromoCode,
          style: FontUtilities.h16(
              fontColor: Colors.white, fontWeight: FWT.semiBold),
        ),
        verticalSpacing(5),
        Text(
          AppText.ifYouHaveAPromoCodeEnterItAndSaveOnYourOrder,
          textAlign: TextAlign.center,
          style: FontUtilities.h12(
              fontColor: const Color(0xffb9aeca), fontWeight: FWT.regular),
        ),
      ],
    ),
  );
}

Widget promoCodeWidget() {
  return InkWell(
    onTap: () {
      Get.toNamed(RoutePath.promoCode);
    },
    child: Container(
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
          color: Color(0xff452767),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppText.promoCode,
            style: FontUtilities.h14(
                fontColor: Colors.white, fontWeight: FWT.black),
          ),
          Text(
            AppText.apply,
            style: FontUtilities.h14(
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
                fontColor: Colors.white,
                fontWeight: FWT.semiBold),
          ),
        ],
      ),
    ),
  );
}

Widget nearbyRestaurantFood() {
  return Container(
    margin: const EdgeInsets.only(left: 20),
    child: Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: titleMenu(AppText.nearbyBestRestaurant, AppText.all,
                restaurant, Colors.white)),
        verticalSpacing(20),
        SizedBox(
          height: 250,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: restaurant.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    var data = {"model": restaurant[index]};
                    Get.toNamed(RoutePath.restaurantDetails, arguments: data);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: 150,
                        alignment: Alignment.bottomCenter,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage(restaurant[index].img),
                                fit: BoxFit.cover)),
                      ),
                      verticalSpacing(10),
                      Text(
                        restaurant[index].title,
                        style: FontUtilities.h14(
                            decorationColor: Colors.blue,
                            fontColor: Colors.white,
                            fontWeight: FWT.semiBold),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    ),
  );
}

Widget resendSend(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppText.recentSearch,
          style: FontUtilities.h14(
            fontColor: Theme.of(context).subTitleText,
          ),
        ),
        verticalSpacing(10),
        Column(
          children: List.generate(
              recentSearch.length,
              (index) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_time_filled_outlined,
                          color: Theme.of(context).btnOffColor,
                          size: 20,
                        ),
                        horizontalSpacing(10),
                        Text(
                          recentSearch[index].title,
                          style: FontUtilities.h14(
                            decorationColor: Colors.white,
                            fontColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )),
        )
      ],
    ),
  );
}

Widget applyWidget(BuildContext context, RxList<SortList> list) {
  return SizedBox(
    width: Get.width,
    child: Column(
        children: List.generate(
            sortList.length, (index) => titleThree(context, list[index]))),
  );
}

Widget filterWidget(BuildContext context, RxDouble start, RxDouble end,
    RxList<FilterList> list) {
  return SizedBox(
    width: Get.width,
    child: Column(
      children: [
        verticalSpacing(25),
        Text(
          AppText.priceRange,
          style: FontUtilities.h16(
              fontColor: Colors.white, fontWeight: FWT.semiBold),
        ),
        verticalSpacing(10),
        priceSliderWidget(start, end, context),
        verticalSpacing(25),
        Text(
          AppText.dietary,
          style: FontUtilities.h16(
              fontColor: Colors.white, fontWeight: FWT.semiBold),
        ),
        verticalSpacing(20),
        Column(
          children: List.generate(
              list.length, (index) => titleThree(context, list[index])),
        ),
        verticalSpacing(25),
        Text(
          AppText.cuisines,
          style: FontUtilities.h16(
              fontColor: Colors.white, fontWeight: FWT.semiBold),
        ),
        verticalSpacing(20),
        cuisinesListWidget(context),
      ],
    ),
  );
}

Widget cuisinesListWidget(BuildContext context) {
  return menuCategoryTwo(context);
}

Widget menuCategoryTwo(BuildContext context) {
  return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
          itemCount: category.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) => InkWell(
                onTap: () {},
                child: Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(right: 10),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color(0xff4a3367),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Theme.of(context).buttonSec,
                            shape: BoxShape.circle),
                        child: Image.asset(category[index].img),
                      ),
                      Text(
                        category[index].title,
                        style: FontUtilities.h12(
                            fontColor: Colors.white, fontWeight: FWT.regular),
                      ),
                    ],
                  ),
                ),
              )));
}

Widget priceSliderWidget(RxDouble start, RxDouble end, context) {
  return Column(
    children: [
      RangeSlider(
        labels: RangeLabels(start.value.toString(), end.value.toString()),
        values: RangeValues(start.value, end.value),
        activeColor: Theme.of(context).btnOffColor,
        inactiveColor: const Color(0xff796089),
        onChanged: (value) {
          start.value = value.start;
          end.value = value.end;
        },
        min: 0,
        max: 100,
      ),
      Text(
        "\$" +
            start.value.toInt().toString() +
            " - " +
            "\$" +
            end.value.toInt().toString(),
        style: FontUtilities.h14(
            fontColor: Colors.white, fontWeight: FWT.semiBold),
      ),
    ],
  );
}

Widget titleThree(context, dynamic model) {
  return Column(
    children: [
      ListTile(
        title: Text(
          model.title,
          style: FontUtilities.h12(
              fontColor: Colors.white, fontWeight: FWT.regular),
        ),
        trailing: Visibility(
            visible: model.checkClick,
            child: const Icon(
              Icons.check,
              color: Colors.green,
            )),
        onTap: () {
          if (model.checkClick == true) {
            model.checkClick = false;
          } else {
            model.checkClick = true;
          }
        },
      ),
      horizontalLine(context),
    ],
  );
}

Widget filterButton(BuildContext context, RxBool check) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      InkWell(
        onTap: () {
          check.value = true;
        },
        child: Container(
          width: 100,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 5),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: check.value
                  ? Theme.of(context).btnOffColor
                  : const Color(0xff552d6c)),
          child: Text(
            AppText.filter,
            style: FontUtilities.h14(
                decorationColor: Colors.white,
                fontColor: Colors.white,
                fontWeight: FWT.semiBold),
          ),
        ),
      ),
      InkWell(
        onTap: () {
          check.value = false;
        },
        child: Container(
          width: 100,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 5),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: check.value == false
                  ? Theme.of(context).btnOffColor
                  : const Color(0xff552d6c)),
          child: Text(
            AppText.sort,
            style: FontUtilities.h14(
                decorationColor: Colors.white,
                fontColor: Colors.white,
                fontWeight: FWT.semiBold),
          ),
        ),
      ),
    ],
  );
}

Widget horizontalLine(BuildContext context) {
  return Container(
    height: 1,
    width: Get.width,
    margin: const EdgeInsets.symmetric(horizontal: 20),
    color: Theme.of(context).subTitleText,
  );
}

Widget horizontalLineTwo(BuildContext context) {
  return Container(
    height: 1,
    width: Get.width,
    color: Theme.of(context).subTitleText,
  );
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

Widget restaurantListWidget(BuildContext context, Restaurant model) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: titleMenu(AppText.menu, AppText.all, popular, Colors.white),
      ),
      verticalSpacing(20),
      Container(
        height: 200,
        padding: const EdgeInsets.only(left: 20),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: bestOfferList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.lazyPut(() => ProductDetailsController());
                  var data = {
                    "model": bestOfferList[index],
                  };
                  Get.toNamed(RoutePath.productDetails, arguments: data);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                              image: AssetImage(bestOfferList[index].img),
                              fit: BoxFit.cover)),
                    ),
                    verticalSpacing(10),
                    Text(
                      bestOfferList[index].title,
                      style: FontUtilities.h14(
                          decorationColor: Colors.blue,
                          fontColor: Colors.white,
                          fontWeight: FWT.semiBold),
                    ),
                  ],
                ),
              );
            }),
      ),
    ],
  );
}

Widget restaurantAddressWidget(BuildContext context, Restaurant model) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppText.averageCost,
              textAlign: TextAlign.start,
              style: FontUtilities.h13(
                  fontColor: Colors.white, fontWeight: FWT.regular),
            ),
            Text(
              "\$16 - \$19",
              textAlign: TextAlign.start,
              style: FontUtilities.h14(
                  fontColor: Colors.white, fontWeight: FWT.bold),
            ),
          ],
        ),
        verticalSpacing(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppText.home,
              textAlign: TextAlign.start,
              style: FontUtilities.h13(
                  fontColor: Colors.white, fontWeight: FWT.regular),
            ),
            Text(
              "Open now 6am - 6pm",
              textAlign: TextAlign.start,
              style: FontUtilities.h14(
                  fontColor: Colors.white, fontWeight: FWT.bold),
            ),
          ],
        ),
        verticalSpacing(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppText.phone,
              textAlign: TextAlign.start,
              style: FontUtilities.h13(
                  fontColor: Colors.white, fontWeight: FWT.regular),
            ),
            Text(
              "+1 1234 56789 258",
              textAlign: TextAlign.start,
              style: FontUtilities.h14(
                  fontColor: Colors.white, fontWeight: FWT.bold),
            ),
          ],
        ),
        verticalSpacing(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppText.website,
              textAlign: TextAlign.start,
              style: FontUtilities.h13(
                  fontColor: Colors.white, fontWeight: FWT.regular),
            ),
            Text(
              "www.mslgoel.com",
              textAlign: TextAlign.start,
              style: FontUtilities.h14(
                  decorationColor: Colors.blue,
                  fontColor: Colors.white,
                  fontWeight: FWT.bold),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget restaurantTitleWidget(BuildContext context, Restaurant model) {
  return Container(
    margin: const EdgeInsets.only(top: 230),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.title,
              textAlign: TextAlign.start,
              style: FontUtilities.h24(
                  fontColor: Colors.white, fontWeight: FWT.semiBold),
            ),
            Text(
              model.fullAddress,
              textAlign: TextAlign.start,
              style: FontUtilities.h11(
                  fontColor: Colors.white, fontWeight: FWT.regular),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 25,
                ),
                horizontalSpacing(5),
                Text(
                  model.rating,
                  style: FontUtilities.h20(
                      fontColor: Colors.white, fontWeight: FWT.black),
                ),
              ],
            ),
            Text(
              model.review,
              textAlign: TextAlign.start,
              style: FontUtilities.h12(
                  decorationColor: Colors.white,
                  fontColor: Colors.white,
                  fontWeight: FWT.regular),
            ),
          ],
        )
      ],
    ),
  );
}

Widget appBarThreeWidget(String title, bool rightIcon) {
  return Container(
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
        Visibility(
          visible: rightIcon == null ? false : true,
          child: const Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.search,
                color: Colors.white,
              )),
        ),
      ],
    ),
  );
}

Widget restaurantDetailsWidget(BuildContext context, Restaurant model) {
  return Container(
    height: 250,
    alignment: Alignment.bottomCenter,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    decoration: BoxDecoration(
        color: Colors.transparent,
        image:
            DecorationImage(image: AssetImage(model.img), fit: BoxFit.cover)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        appBarThreeWidget("", true),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Theme.of(context).btnOffColor,
                  borderRadius: const BorderRadius.all(Radius.circular(25))),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 15,
                  ),
                  Text(
                    "Show Map",
                    style: FontUtilities.h14(
                        fontColor: Colors.white, fontWeight: FWT.semiBold),
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
              width: 30,
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Image.asset(AppImages.heartIcon),
            ),
          ],
        ),
      ],
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
