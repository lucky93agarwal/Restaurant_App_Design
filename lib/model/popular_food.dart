import 'package:restaurant_app_design/utils/images.dart';

const List<Popular> popular = [
  Popular(
      id: '1',
      img: AppImages.chholeBhatureFoodImg,
      title: 'Chhole Bhature',
      rating: '4.9',
      fullName: 'Choley Bhature',
      details:
          'Restaurants in Kanpur, Kanpur Restaurants, Barra restaurants, Best Barra restaurants, Govind Nagar restaurants, Quick Bites in Kanpur, Quick Bites near me, Quick Bites in Barra, in Kanpur, near me, in Barra, in Kanpur, near me, in Barra, Order food online in Barra, Order food online in Kanpur',
      review: '(670 Review)',
      off: "30% off",
      cal: "600 Cal.",
      brand:"Haldiram\'s",
      price: "\$15"),
  Popular(
      id: '2',
      img: AppImages.vadaPavFoodImg,
      title: 'Vada Pav',
      rating: '4.6',
      fullName: 'Samocha - Stories Around Chai',
      details:
          'Restaurants in Kanpur, Kanpur Restaurants, Barra restaurants, Best Barra restaurants, Govind Nagar restaurants, Quick Bites in Kanpur, Quick Bites near me, Quick Bites in Barra, in Kanpur, near me, in Barra, in Kanpur, near me, in Barra, Order food online in Barra, Order food online in Kanpur',
      review: '(1247 Review)',
      off: "30% off",
      cal: "600 Cal.",
      brand:"Haldiram\'s",
      price: "\$18"),
  Popular(
      id: '3',
      img: AppImages.kulcheeFoodImg,
      title: 'Kulche',
      rating: '4.5',
      fullName: 'Paneer Kulcha with Paneer Chole',
      details:
          'Restaurants in Kanpur, Kanpur Restaurants, Barra restaurants, Best Barra restaurants, Govind Nagar restaurants, Quick Bites in Kanpur, Quick Bites near me, Quick Bites in Barra, in Kanpur, near me, in Barra, in Kanpur, near me, in Barra, Order food online in Barra, Order food online in Kanpur',
      review: '(1866 Review)',
      off: "30% off",
      cal: "600 Cal.",
      brand:"Haldiram\'s",
      price: "\$25"),
];

class Popular {
  final String id;
  final String img;
  final String title;
  final String fullName;
  final String details;
  final String rating;
  final String review;
  final String off;
  final String price;
  final String cal;
  final String brand;


  const Popular({
    required this.id,
    required this.img,
    required this.title,
    required this.fullName,
    required this.details,
    required this.rating,
    required this.review,
    required this.off,
    required this.price,
    required this.cal,
    required this.brand,
  });
}
