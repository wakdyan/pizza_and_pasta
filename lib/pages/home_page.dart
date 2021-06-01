import 'package:flutter/material.dart';

import '../themes/app_color.dart';
import '../widgets/business_lunch.dart';
import '../widgets/favorite_food.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FavoriteFood(),
              BusinessLunch(),
            ],
          ),
        ),
      ),
    );
  }
}
