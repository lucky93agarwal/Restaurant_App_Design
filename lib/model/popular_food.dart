




import 'package:restaurant_app_design/utils/images.dart';

const List<Popular> popular = [
  Popular(
    id: '1',
    img: AppImages.chholeBhatureFoodImg,
    title: 'Chhole Bhature',
    rating: '4.9',
    review: '(670 Review)',
      off: "30% off",
      price: "\$15"
  ),
  Popular(
    id: '2',
    img: AppImages.vadaPavFoodImg,
    title: 'Vada Pav',
    rating: '4.6',
    review: '(1247 Review)',
      off: "30% off",
      price: "\$18"
  ),
  Popular(
    id: '3',
    img: AppImages.kulcheeFoodImg,
    title: 'Kulchee',
    rating: '4.5',
    review: '(1866 Review)',
      off: "30% off",
      price: "\$25"
  ),
];


class Popular{
  final String id;
  final String img;
  final String title;
  final String rating;
  final String review;
  final String off;
  final String price;
  const Popular({
    required this.id,
    required this.img,
    required this.title,
    required this.rating,
    required this.review,
    required this.off,
    required this.price,
  });
}