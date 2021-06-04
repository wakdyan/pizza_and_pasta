import 'package:flutter/material.dart';

import '../models/food.dart';
import '../pages/detail_page.dart';
import '../pages/home_page.dart';
import '../themes/app_decoration.dart';
import '../themes/app_text_style.dart';
import '../values/data.dart';
import '../values/dimens.dart';
import 'rating.dart';

class BusinessLunch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(title: Text('Business lunch', style: headerStyle)),
        ListView.separated(
          itemCount: businessLunches.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: smallPadding),
          itemBuilder: (context, index) {
            return _buildBusinessLunchItem(context, businessLunches[index]);
          },
          separatorBuilder: (_, __) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: smallPadding),
            );
          },
        )
      ],
    );
  }

  Widget _buildBusinessLunchItem(BuildContext context, Food food) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => _moveToDetailPage(context, food),
      child: Container(
        height: businessCardHeight,
        margin: const EdgeInsets.symmetric(horizontal: largePadding),
        decoration: cardDecoration,
        child: Row(
          children: <Widget>[
            _buildBusinessLunchInfo(food),
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(cardRadius),
                  bottomRight: Radius.circular(cardRadius),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: -30,
                      child: SizedBox(
                        height: (size.width - largePadding * 2) / 5 * 2 + 40,
                        child: Hero(
                          tag: food.id,
                          child: Image.asset(food.imageUrl, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBusinessLunchInfo(Food food) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: largePadding),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Rating(food.rating),
                  Text(
                    currency.format(food.price),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    strutStyle: StrutStyle(fontSize: 20),
                  )
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
