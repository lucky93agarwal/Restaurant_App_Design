




import 'package:restaurant_app_design/utils/images.dart';

List<FilterList> filterList = [
  FilterList(
      id: '1',
      title: 'Vegetarian',
      checkClick:true
  ),
  FilterList(
      id: '2',
      title: 'Vegan',
      checkClick:false
  ),
  FilterList(
      id: '3',
      title: 'Suger-free',
      checkClick:false
  ),
];


class FilterList{
  final String id;
  final String title;
  bool checkClick;
  FilterList({
    required this.id,
    required this.title,
    required this.checkClick
  });
}