




import 'package:restaurant_app_design/utils/images.dart';

List<SortList> sortList = [
  SortList(
      id: '1',
      title: 'Recommended',
      checkClick:true
  ),
  SortList(
      id: '2',
      title: 'Most Popular',
      checkClick:false
  ),
  SortList(
      id: '3',
      title: 'Rating',
      checkClick:false
  ),
  SortList(
      id: '4',
      title: 'High Price',
      checkClick:false
  ),
  SortList(
      id: '5',
      title: 'Low Price',
      checkClick:false,
  ),
];


class SortList{
  final String id;
  final String title;
  bool checkClick;
  SortList({
    required this.id,
    required this.title,
    required this.checkClick
  });
}