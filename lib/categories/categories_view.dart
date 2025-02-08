import 'package:flutter/material.dart';
import 'package:news/categories/category_item.dart';
import 'package:news/models/category_model.dart';

class CategoriesView extends StatelessWidget {
  CategoriesView({required this.onCategorySelected});
  void Function(CategoryModel) onCategorySelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Morning\nHere is Some News For You',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: 16),
              itemBuilder: (_, index) => InkWell(
                  child: InkWell(
                onTap: () {
                  onCategorySelected(CategoryModel.categories[index]);
                },
                child: CategoryItem(
                  CategoryModel.categories[index],
                ),
              )),
              itemCount: CategoryModel.categories.length,
              separatorBuilder: (_, __) => SizedBox(height: 16),
            ),
          )
        ],
      ),
    );
  }
}
