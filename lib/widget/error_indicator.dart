import 'package:flutter/material.dart';
import 'package:news/app_them.dart';

class ErrorIndicator extends StatelessWidget {
  String errorMessage='';
  ErrorIndicator(this.errorMessage);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: TextStyle(color: AppThem.white),
      ),
    );
  }
}
