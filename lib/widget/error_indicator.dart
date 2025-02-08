import 'package:flutter/material.dart';
import 'package:news/app_them.dart';

class ErrorIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Something went wrong',
        style: TextStyle(color: AppThem.white),
      ),
    );
  }
}
