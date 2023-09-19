




import 'package:restaurant_app_design/utils/images.dart';

const List<RecentSearch> recentSearch = [
  RecentSearch(
      id: '1',
      img: AppImages.pizzaHutImg,
      title: 'Japanese',
      rating: '4.9',
      review: '(670 Review)',
      off: "30% off"
  ),
  RecentSearch(
      id: '2',
      img: AppImages.mcdonaldImg,
      title: 'Spice',
      rating: '4.6',
      review: '(1247 Review)',
      off: "30% off"
  ),
  RecentSearch(
      id: '3',
      img: AppImages.burgerKingInLondonImg,
      title: 'Chinese',
      rating: '4.5',
      review: '(1866 Review)',
      off: "30% off"
  ),
  RecentSearch(
      id: '4',
      img: AppImages.kfcImg,
      title: 'Fast Food',
      rating: '4.5',
      review: '(1866 Review)',
      off: "30% off"
  ),
  RecentSearch(
      id: '5',
      img: AppImages.kfcImg,
      title: 'Vegan',
      rating: '4.5',
      review: '(1866 Review)',
      off: "30% off"
  ),
];


class RecentSearch{
  final String id;
  final String img;
  final String title;
  final String rating;
  final String review;
  final String off;
  const RecentSearch({
    required this.id,
    required this.img,
    required this.title,
    required this.rating,
    required this.review,
    required this.off,
  });
}