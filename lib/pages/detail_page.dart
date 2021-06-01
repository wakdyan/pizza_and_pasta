import 'package:flutter/material.dart';

import '../models/food.dart';
import '../themes/app_color.dart';
import '../themes/app_decoration.dart';
import '../themes/app_text_style.dart';
import '../values/data.dart';
import '../values/dimens.dart';
import '../widgets/rating.dart';

class DetailPage extends StatefulWidget {
  final Food food;

  const DetailPage(this.food);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.food.name)),
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset(
                widget.food.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildFoodInfo(),
            _buildFoodSize(context),
          ],
        ),
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
            widget.food.price,
            style: priceStyle,
            strutStyle: StrutStyle(fontSize: 20),
          ),
        )
      ],
    );
  }

  Widget _buildFoodSize(BuildContext context) {
    return Container(
      height: 48,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: largePadding),
      child: Center(
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: foodSizes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => setState(() => _selectedIndex = index),
              child: Container(
                height: 48,
                width: 48,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(smallPadding),
                decoration: _selectedIndex == index
                    ? selectedSizeDecoration
                    : unselectedSizeDecoration,
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
}
