




import 'package:restaurant_app_design/utils/app_text.dart';
import 'package:restaurant_app_design/utils/images.dart';

List<ReviewList> reviewList = [
  ReviewList(
      id: '1',
      img: AppImages.girlTwo,
      name:"Jenni",
      review:"4.9",
      note: AppText.loremIpsumLongText
  ),
  ReviewList(
      id: '2',
      img: AppImages.manTwo,
      name:"Paul Adam",
      review:"4.9",
      note: AppText.loremIpsumLongText
  ),
  ReviewList(
      id: '3',
      img: AppImages.girlOne,
      name:"Sushi",
      review:"4.7",
      note: AppText.loremIpsumLongText
  ),
  ReviewList(
    id: '4',
    img: AppImages.manOne,
    name:"Pitorson",
      review:"4.6",
      note: AppText.loremIpsumLongText
  ),

  ReviewList(
      id: '5',
      img: AppImages.girlThree,
      name:"Sushi",
      review:"4.5",
      note: AppText.loremIpsumLongText
  ),
  ReviewList(
      id: '6',
      img: AppImages.manThree,
      name:"Pitorson",
      review:"4.9",
    note: AppText.loremIpsumLongText
  ),
];


class ReviewList{
  final String id;
  final String img;
  final String name;
  final String review;
  final String note;
  ReviewList({
    required this.id,
    required this.img,
    required this.name,
    required this.review,
    required this.note,
  });
}