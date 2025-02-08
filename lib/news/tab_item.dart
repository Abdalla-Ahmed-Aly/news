import 'package:flutter/material.dart';
import 'package:news/models/sourse_model.dart';

class TabItem extends StatelessWidget {
  TabItem({super.key, required this.sourse, required this.isSelected});
  SourseModel sourse;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(sourse.name,
        style: isSelected ? textTheme.titleMedium : textTheme.titleSmall);
  }
}
