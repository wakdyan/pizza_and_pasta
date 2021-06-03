import 'package:flutter/material.dart';

import '../themes/app_color.dart';
import '../themes/app_text_style.dart';
import 'home_page.dart';

class OrderConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check_circle_outline,
                size: 100,
                color: AppColor.accent,
              ),
              Text(
                'Your order is completed',
                style: titleStyle,
                textAlign: TextAlign.center,
                strutStyle: StrutStyle(fontSize: 24),
              ),
              Text(
                'You will be receiving a confirmation email with order detail',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 48),
              ElevatedButton.icon(
                onPressed: () => _moveToHomePage(context),
                style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                icon: Icon(Icons.explore),
                label: Text('EXPLORE MORE FOODS'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _moveToHomePage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => HomePage()),
      (route) => false,
    );
  }
}
