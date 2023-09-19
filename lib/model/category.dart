




import 'package:restaurant_app_design/utils/images.dart';

const List<Category> category = [
  Category(
    id: '1',
    img: AppImages.pizzaIcon,
  ),
  Category(
    id: '2',
    img: AppImages.breadIcon,
  ),
  Category(
    id: '3',
    img: AppImages.iceBowlIcon,
  ),
  Category(
    id: '4',
    img: AppImages.iceCreamIcon,
  ),
  Category(
    id: '5',
    img: AppImages.kawaiiIcon,
  ),
];


class Category{
  final String id;
  final String img;
  const Category({
    required this.id,
    required this.img,
  });
}