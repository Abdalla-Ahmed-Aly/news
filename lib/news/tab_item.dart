import 'package:flutter/material.dart';
import 'package:news/models/sourse_response/source.dart';

class TabItem extends StatelessWidget {
  TabItem({required this.sourse, required this.isSelected});
  Source sourse;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(sourse.name!,
        style: isSelected ? textTheme.titleMedium : textTheme.titleSmall);
  }
}
