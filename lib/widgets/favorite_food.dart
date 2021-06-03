import 'package:flutter/material.dart';

import '../models/food.dart';
import '../pages/detail_page.dart';
import '../pages/home_page.dart';
import '../themes/app_decoration.dart';
import '../themes/app_text_style.dart';
import '../values/data.dart';
import '../values/dimens.dart';
import 'rating.dart';

class FavoriteFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(title: _buildTextRich()),
        Container(
          height: favoriteListHeight,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
            itemCount: favoriteFoods.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(largePadding),
            itemBuilder: (context, index) {
              return _buildFavoriteFoodItem(context, favoriteFoods[index]);
            },
            separatorBuilder: (_, __) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: smallPadding),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFavoriteFoodItem(BuildContext context, Food food) {
    return GestureDetector(
      onTap: () => _moveToDetailPage(context, food),
      child: Container(
        decoration: cardDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(cardRadius),
                  topRight: Radius.circular(cardRadius),
                ),
                child: SizedBox(
                  width: favoriteCardWidth,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -30,
                        left: -70,
                        child: SizedBox(
                          height: (favoriteCardHeight / 3) * 2 + 30,
                          width: favoriteCardWidth + 70,
                          child: Image.asset(
                            food.imageUrl,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _buildFavoriteFoodInfo(food),
          ],
        ),
      ),
    );
  }

  Widget _buildTextRich() {
    return Text.rich(
      TextSpan(
        text: 'Favorite ',
        style: headerStyle,
        children: [
          TextSpan(
            text: 'dishes',
            style: headerStyle.copyWith(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteFoodInfo(Food food) {
    return Expanded(
      flex: 1,
      child: SizedBox(
        width: favoriteCardWidth,
        child: ListTile(
          isThreeLine: true,
          title: Text(
            food.name,
            style: titleStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(food.tag, strutStyle: StrutStyle(fontSize: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Rating(food.rating),
                  Text(currency.format(food.price), style: priceStyle)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _moveToDetailPage(BuildContext context, Food food) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetailPage(food)),
    );
  }
}
