import 'package:flutter/material.dart';
import 'package:news/categories/categories_view.dart';
import 'package:news/drawer/home_drawer.dart';
import 'package:news/models/category_model.dart';
import 'package:news/news/news_view.dart';

class Homescreen extends StatefulWidget {
  static const String routName = '/home';

  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  CategoryModel? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? 'Home' : selectedCategory!.name,
        ),
      ),
      body: selectedCategory == null
          ? CategoriesView(
              onCategorySelected: onCategorySelected,
            )
          : NewsView(
              categoryId: selectedCategory!.id,
            ),
      drawer: HomeDrawer(onGotoHomeCliced: resetSelectedCaegory),
    );
  }

  void onCategorySelected(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }

  void resetSelectedCaegory() {
    if (selectedCategory == null) return;
    selectedCategory = null;
    setState(() {});
  }
}
