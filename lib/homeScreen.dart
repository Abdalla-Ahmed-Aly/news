import 'package:flutter/material.dart';
import 'package:news/app_them.dart';
import 'package:news/categories/categories_view.dart';
import 'package:news/drawer/home_drawer.dart';
import 'package:news/models/category_model.dart';
import 'package:news/news/news_view.dart';
import 'package:news/widget/DefualtTextFromFiled.dart';

class Homescreen extends StatefulWidget {
  static const String routName = '/home';

  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  CategoryModel? selectedCategory;
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  String searchQuery = ''; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? DefaultTextFormFiled(
                controller: searchController,
                onClose: () {
                  isSearching = false;
                  searchQuery = ''; 
                  searchController.clear();
                  setState(() {});
                },
                hintText: 'Search',
                isSearching: isSearching,
                onChanged: (query) {
                  setState(() {
                    searchQuery = query.toLowerCase();
                  });
                },
              )
            : Text(
                selectedCategory == null ? 'Home' : selectedCategory!.name,
              ),
        actions: isSearching
            ? []
            : [
                IconButton(
                  onPressed: () {
                    isSearching = true;
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.search_outlined,
                    size: 30,
                    color: AppThem.white,
                  ),
                ),
              ],
      ),
      body: selectedCategory == null
          ? CategoriesView(
              onCategorySelected: onCategorySelected,
              searchQuery: searchQuery,
            )
          : NewsView(
              categoryId: selectedCategory!.id,
              searchQuery: searchQuery, 
            ),
      drawer: isSearching
          ? null
          : HomeDrawer(onGotoHomeCliced: resetSelectedCategory),
    );
  }

  void onCategorySelected(CategoryModel category) {
    selectedCategory = category;
    isSearching = false;
    searchQuery = '';
    searchController.clear();
    setState(() {});
  }

  void resetSelectedCategory() {
    if (selectedCategory == null) return;
    selectedCategory = null;
    searchQuery = ''; // **🔄 إعادة ضبط البحث عند العودة للصفحة الرئيسية**
    searchController.clear();
    setState(() {});
  }
}
