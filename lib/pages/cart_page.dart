import 'package:flutter/material.dart';

import '../models/food.dart';
import '../themes/app_color.dart';
import '../themes/app_decoration.dart';
import '../values/data.dart';
import 'home_page.dart';
import 'order_confirmation_page.dart';

final carts = <Food>[];

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _addressController = TextEditingController();

  bool _isLoading = false;
  String _address;

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: carts.isEmpty
          ? Center(child: Text('Your cart still empty'))
          : _buildCart(),
    );
  }

  Widget _buildCart() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFoodList(),
            _buildAddress(context),
            _buildPayment(context),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildFoodList() {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 16),
      physics: NeverScrollableScrollPhysics(),
      itemCount: carts.length,
      itemBuilder: (_, index) {
        final food = carts[index];
        return Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
          child: Row(
            children: <Widget>[
              Container(
                height: 86,
                width: 86,
                margin: const EdgeInsets.only(right: 16),
                child: Image.asset(food.imageUrl, fit: BoxFit.fill),
              ),
              Expanded(
                child: ListTile(
                  title: Text(food.name),
                  subtitle: _buildFoodSize(food),
                  trailing: Text(currency.format(food.price)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAddress(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(8),
      decoration: cardDecoration,
      child: Column(
        children: [
          ListTile(
            onTap: () => _showAddressSheet(context),
            leading: Icon(Icons.location_on),
            title: Text(
              _address ?? 'Add Your Address',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text('30-45 min'),
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('Cash'),
          ),
        ],
      ),
    );
  }

  Widget _buildPayment(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: textTheme.caption,
                strutStyle: StrutStyle(fontSize: 24),
              ),
              Text(
                currency.format(_getCartPrice()),
                style: textTheme.caption,
                strutStyle: StrutStyle(fontSize: 24),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery Fee',
                style: textTheme.caption,
                strutStyle: StrutStyle(fontSize: 24),
              ),
              Text(
                currency.format(deliveryFee),
                style: textTheme.caption,
                strutStyle: StrutStyle(fontSize: 24),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: textTheme.headline6,
                strutStyle: StrutStyle(fontSize: 24),
              ),
              Text(
                currency.format(_getTotalPrice()),
                style: textTheme.headline6,
                strutStyle: StrutStyle(fontSize: 24),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFoodSize(Food food) {
    var result = food.size.map((e) => 'x${e.quantity} ${e.name}');

    return Text(result.join('\n'));
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return ElevatedButton(
      onPressed: _address.isEmpty ? null : () => _order(context),
      style: ElevatedButton.styleFrom(shape: BeveledRectangleBorder()),
      child: _isLoading ? CircularProgressIndicator() : Text('PLACE ORDER'),
    );
  }

  double _getCartPrice() {
    return carts.fold<double>(0, (previousValue, element) {
      return previousValue +
          element.price *
              element.size.fold<int>(0, (previousValue, element) {
                return previousValue + element.quantity;
              });
    });
  }

  double _getTotalPrice() => _getCartPrice() + deliveryFee;

  Future<void> _showAddressSheet(BuildContext context) {
    if (_address == null) {
      _addressController.clear();
    } else {
      _addressController.text = _address;
    }
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ListTile(
            title: TextField(
              controller: _addressController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Type your address',
              ),
            ),
            trailing: TextButton(
              style: TextButton.styleFrom(primary: AppColor.accentLight),
              child: Text('SELESAI'),
              onPressed: () {
                if (_addressController.text.isNotEmpty) {
                  setState(() => _address = _addressController.text);
                }
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  Future<void> _order(BuildContext context) {
    setState(() => _isLoading = true);

    return Future.delayed(Duration(seconds: 2), () {
      setState(() => _isLoading = false);
      _moveToOrderConfirmationPage(context);
      carts.clear();
    });
  }

  void _moveToOrderConfirmationPage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => OrderConfirmationPage()),
      (route) => false,
    );
  }
}
