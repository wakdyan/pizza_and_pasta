import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../models/food.dart';
import '../themes/app_color.dart';
import '../themes/app_decoration.dart';
import '../themes/app_text_style.dart';
import '../values/data.dart';
import '../values/dimens.dart';
import '../widgets/rating.dart';
import 'cart_page.dart';
import 'home_page.dart';

class DetailPage extends StatefulWidget {
  final Food food;

  const DetailPage(this.food);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.food.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Hero(
                tag: widget.food.id,
                child: Image.asset(
                  widget.food.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _buildFoodInfo(),
            _buildFoodSizeButton(context),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: ElevatedButton(
              onPressed: _selectedIndex == null ? null : _addToCart,
              style: ElevatedButton.styleFrom(shape: BeveledRectangleBorder()),
              child: Text('ADD TO CART'),
            ),
          ),
          Expanded(
            flex: 3,
            child: ElevatedButton(
              onPressed: () => _moveToCartPage(context),
              style: ElevatedButton.styleFrom(
                shape: BeveledRectangleBorder(),
                primary: AppColor.accent,
                onPrimary: AppColor.onAccent,
              ),
              child: Badge(
                showBadge: carts.isEmpty ? false : true,
                badgeContent: Text(
                  _getTotalQuantity(),
                  style: badgeStyle,
                ),
                padding: const EdgeInsets.all(4),
                child: Icon(Icons.shopping_cart),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: largePadding),
          child: Rating(widget.food.rating),
        ),
        ListTile(
          isThreeLine: true,
          title: Text(widget.food.name, style: titleStyle),
          subtitle: Text(widget.food.description),
          trailing: Text(
            currency.format(widget.food.price),
            style: priceStyle,
            strutStyle: StrutStyle(fontSize: 20),
          ),
        )
      ],
    );
  }

  Widget _buildFoodSizeButton(BuildContext context) {
    return Container(
      height: 48,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: largePadding),
      child: Center(
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: foodSizes.length,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () => _onFoodSizeButtonTapped(index),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                height: 48,
                width: 48,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(smallPadding),
                decoration: _selectedIndex == index
                    ? selectedFoodSizeDecoration
                    : unselectedFoodSizeDecoration,
                child: Text(
                  foodSizes[index],
                  style: TextStyle(
                    color: _selectedIndex == index
                        ? AppColor.onPrimary
                        : AppColor.onSurface,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (_, __) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: largePadding),
            );
          },
        ),
      ),
    );
  }

  void _moveToCartPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CartPage()),
    );
  }

  void _onFoodSizeButtonTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  void _addToCart() {
    var foods = carts.where((element) => element.name == widget.food.name);
    if (foods.isEmpty) {
      carts.add(widget.food..size = [FoodSize(foodSizes[_selectedIndex])]);
    } else {
      var sizes = foods.first.size
          .where((element) => element.name == foodSizes[_selectedIndex]);
      if (sizes.isEmpty) {
        foods.first.size.add(FoodSize(foodSizes[_selectedIndex]));
      } else {
        sizes.first.quantity += 1;
      }
    }

    setState(() {});
  }

  String _getTotalQuantity() {
    return carts.fold<int>(0, (previousValue, element) {
      return previousValue +
          element.size.fold<int>(0, (previousValue, element) {
            return previousValue + element.quantity;
          });
    }).toString();
  }
}
