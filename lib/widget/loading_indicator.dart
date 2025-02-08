import 'package:flutter/material.dart';
import 'package:news/app_them.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppThem.white,
      ),
    );
  }
}
