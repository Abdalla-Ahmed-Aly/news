import 'package:flutter/material.dart';
import 'package:news/categories/category_item.dart';
import 'package:news/models/category_model.dart';

class CategoriesView extends StatefulWidget {
  CategoriesView({required this.onCategorySelected, required this.searchQuery});
  final void Function(CategoryModel) onCategorySelected;

  String searchQuery = "";
  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
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
          SizedBox(height: 10),
          SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: 16),
              itemBuilder: (_, index) {
                final category = CategoryModel.categories[index];
                if (category.name.toLowerCase().contains(widget.searchQuery)) {
                  return InkWell(
                    onTap: () {
                      widget.onCategorySelected(category);
                    },
                    child: CategoryItem(category),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
              itemCount: CategoryModel.categories.length,
              separatorBuilder: (_, __) => SizedBox(height: 16),
            ),
          )
        ],
      ),
    );
  }
}
