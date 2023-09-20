




import 'package:restaurant_app_design/utils/images.dart';

const List<Category> category = [
  Category(
    id: '1',
    img: AppImages.pizzaIcon,
    title: "Italian",
  ),
  Category(
    id: '2',
    img: AppImages.breadIcon,
    title: "Mexican",
  ),
  Category(
    id: '3',
    img: AppImages.iceBowlIcon,
    title: "chinese",
  ),
  Category(
    id: '4',
    img: AppImages.iceCreamIcon,
    title: "American",
  ),
  Category(
    id: '5',
    img: AppImages.kawaiiIcon,
    title: "Italian",
  ),
];


class Category{
  final String id;
  final String img;
  final String title;
  const Category({
    required this.id,
    required this.img,
    required this.title,
  });
}