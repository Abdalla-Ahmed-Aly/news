import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel category;
  CategoryItem(this.category, {super.key});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Image.asset(
        'assets/images/${category.imageName}.png',
        height: MediaQuery.sizeOf(context).height * 0.25,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
