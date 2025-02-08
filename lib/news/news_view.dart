import 'package:flutter/material.dart';
import 'package:news/app_them.dart';
import 'package:news/models/sourse_model.dart';
import 'package:news/news/news_item.dart';
import 'package:news/news/tab_item.dart';

class NewsView extends StatefulWidget {
  static const String routName = '/news';
NewsView({required this.categoryId});
String categoryId;
  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int currenIndex = 0;
  List<SourseModel> sources = List.generate(
      10, (index) => SourseModel(id: '$index', name: 'Sourse $index'));
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: sources.length,
          child: TabBar(
            isScrollable: true,
            dividerColor: Colors.transparent,
            indicatorColor: AppThem.white,
            tabAlignment: TabAlignment.start,
            labelPadding: EdgeInsetsDirectional.only(end: 16),
            padding: EdgeInsetsDirectional.only(start: 16),
            onTap: (index) {
              if (currenIndex == index) return;
              currenIndex = index;
              setState(() {});
            },
            tabs: sources
                .map(
                  (source) => TabItem(
                      sourse: source,
                      isSelected: currenIndex == sources.indexOf(source)),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.only(top: 16,right: 16,left: 16),
            itemBuilder: (_, index) => NewsItem(),
            itemCount: 10,
            separatorBuilder: (_, __) => SizedBox(height: 24,),
          ),
        ),
      ],
    );
  }
}
