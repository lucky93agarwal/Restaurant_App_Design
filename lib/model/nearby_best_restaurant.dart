




import 'package:restaurant_app_design/utils/images.dart';

const List<Restaurant> restaurant = [
  Restaurant(
      id: '1',
      img: AppImages.pizzaHutImg,
      title: 'Pizza Hut',
      rating: '4.9',
      review: '(670 Review)',
      off: "30% off"
  ),
  Restaurant(
      id: '2',
      img: AppImages.mcdonaldImg,
      title: 'Mc Donald',
      rating: '4.6',
      review: '(1247 Review)',
      off: "30% off"
  ),
  Restaurant(
      id: '3',
      img: AppImages.burgerKingInLondonImg,
      title: 'Burger King',
      rating: '4.5',
      review: '(1866 Review)',
      off: "30% off"
  ),
  Restaurant(
      id: '4',
      img: AppImages.kfcImg,
      title: 'KFC',
      rating: '4.5',
      review: '(1866 Review)',
      off: "30% off"
  ),
];


class Restaurant{
  final String id;
  final String img;
  final String title;
  final String rating;
  final String review;
  final String off;
  const Restaurant({
    required this.id,
    required this.img,
    required this.title,
    required this.rating,
    required this.review,
    required this.off,
  });
}