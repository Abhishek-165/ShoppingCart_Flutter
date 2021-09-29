import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/Providers/cart.dart';
import 'package:shoppingcart/Providers/product_list.dart';

import 'package:fluttertoast/fluttertoast.dart';

class AllPurposeFlour extends StatefulWidget {
  @override
  _AllPurposeFlourState createState() => _AllPurposeFlourState();
}

class _AllPurposeFlourState extends State<AllPurposeFlour> {
  List<ProductDetail> _productList = [
    ProductDetail(
      image: "assets/images/uttam.png",
      name: "Uttam",
      price: 7.0,
      disPrice: 10,
      discount: 30,
    ),
    ProductDetail(
      image: "assets/images/shankar.png",
      name: "Shankar maida 500gm",
      price: 120.0,
      disPrice: 0,
      discount: 0,
    ),
    ProductDetail(
      image: "assets/images/rajdhani.png",
      name: "Rajdhani Sooji",
      price: 30.00,
      disPrice: 0,
      discount: 0,
    ),
    ProductDetail(
      image: "assets/images/rista.png",
      name: "Rista sooji 1kg",
      price: 120.0,
      disPrice: 0,
      discount: 0,
    ),
    ProductDetail(
      image: "assets/images/uttam.png",
      name: "Uttam 500gm",
      price: 177.0,
      disPrice: 8,
      discount: 6,
    ),
    ProductDetail(
      image: "assets/images/shankar.png",
      name: "Shankar maida 2kg",
      price: 180.0,
      disPrice: 0,
      discount: 0,
    ),
    ProductDetail(
      image: "assets/images/rajdhani.png",
      name: "Rajdhani Sooji 500gm",
      price: 30.00,
      disPrice: 10,
      discount: 5,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    return Scaffold(
        body: ListView.separated(
      itemCount: _productList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Center(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      _productList[index].image,
                      height: 60,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _productList[index].name,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 18),
                        ),
                        Row(
                          children: [
                            Text(
                              "₹ " + _productList[index].price.toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            _productList[index].disPrice != 0
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 4),
                                    child: Text(
                                      "₹" +
                                          _productList[index]
                                              .disPrice
                                              .toString(),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 12),
                                    ),
                                  )
                                : Container(),
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
                          _productList[index].discount != 0
                              ? Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: Text(
                                      _productList[index].discount.toString() +
                                          " % off",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10)),
                                )
                              : Container(),
                          SizedBox(
                            width: 74,
                            child: TextButton(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(245, 113, 113, 1),
                                    border: Border.all(
                                        color:
                                            Color.fromRGBO(245, 113, 113, 1)),
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      child: Text(
                                        "Add",
                                        style: TextStyle(
                                            fontSize: 11.0,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(6.0)),
                                        child: Icon(
                                          Icons.add,
                                          color:
                                              Color.fromRGBO(245, 113, 113, 1),
                                        ))
                                  ],
                                ),
                              ),
                              onPressed: () {
                                cart.addItem(CartItem(
                                    id: DateTime.now().toString(),
                                    product: _productList[index].name,
                                    price: _productList[index].price,
                                    image: _productList[index].image,
                                    category: "All Purpose Flour",
                                    quantity: 1));
                                print(Provider.of<Cart>(context, listen: false)
                                    .items
                                    .length);
                                Fluttertoast.showToast(
                                    msg: "Product added to cart successfully",
                                    gravity: ToastGravity.SNACKBAR,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor:
                                        Color.fromRGBO(232, 228, 227, 1),
                                    textColor: Colors.black,
                                    fontSize: 16.0);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Divider(
            thickness: 1,
            height: 2,
          ),
        );
      },
    ));
  }
}
