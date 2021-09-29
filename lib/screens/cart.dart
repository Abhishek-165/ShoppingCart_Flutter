import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/Providers/cart.dart';
import 'package:shoppingcart/screens/shopping_cart_item.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    print(cart.items.length);
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
            ),
            title: Text("Cart")),
        body: ListView.separated(
            itemCount: cart.items.length,
            itemBuilder: (context, i) => ChangeNotifierProvider.value(
                  value: cart.items[i],
                  child: ShoppingCartItem(),
                ),
            separatorBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(
                    thickness: 1,
                    height: 2,
                  ),
                )));
  }
}
