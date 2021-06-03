import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/business_lunch.dart';
import '../widgets/favorite_food.dart';
import 'cart_page.dart';

final currency = NumberFormat.currency(
  locale: 'id_ID',
  name: 'Rp',
  decimalDigits: 0,
);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _moveToCartPage(context),
        child: Icon(Icons.shopping_cart),
      ),
    );
  }

  void _moveToCartPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => CartPage()));
  }
}
