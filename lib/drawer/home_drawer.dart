import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/app_them.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({required this.onGotoHomeCliced});
  VoidCallback onGotoHomeCliced;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: screenSize.width * 0.7,
      child: Column(
        children: [
          Container(
            color: AppThem.white,
            height: screenSize.height * 0.2,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'News App',
              style: textTheme.titleLarge
                  ?.copyWith(color: AppThem.black, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              color: AppThem.black,
              width: double.infinity,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      onGotoHomeCliced();
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Home.svg',
                          width: 24,
                          height: 24,
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Go to Home',
                          style: textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
