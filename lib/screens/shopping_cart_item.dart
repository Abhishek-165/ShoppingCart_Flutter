import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/Providers/cart.dart';
import 'package:shoppingcart/screens/cart.dart';

class ShoppingCartItem extends StatefulWidget {

  @override
  _ShoppingCartItemState createState() => _ShoppingCartItemState();
}

class _ShoppingCartItemState extends State<ShoppingCartItem> {
  @override
  Widget build(BuildContext context) {
     final cartitem = Provider.of<CartItem>(context);
     
     final cart = Provider.of<Cart>(context);
    return Column(
          children: [
            Center(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      cartitem.image,
                      height: 60,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartitem.product,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 18),
                        ),
                        Row(
                          children: [
                            Text(
                              "₹ " + cartitem.price.toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          IconButton(
                            icon: Icon(Icons.delete_outline),
                            onPressed: () {
                                cart.deleteItem(cartitem.id);
                                 Fluttertoast.showToast(
                                    msg: "Product removed from cart.",
                                    gravity: ToastGravity.SNACKBAR,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor:
                                        Color.fromRGBO(232, 228, 227, 1),
                                    textColor: Colors.black,
                                    fontSize: 16.0);
                                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CartPage()));
                
                            },
                          ),
                        Text("Quantity: "+cartitem.quantity.toString())
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
  }
}