import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class CartItem with ChangeNotifier {
  final String id;
  final String product;
  final double price;
  final String image;
  final String category;
  int quantity;

  CartItem(
      {@required this.id,
      @required this.product,
      @required this.price,
      this.image,
      this.category,
      this.quantity});
}

class Cart with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items {
    return [..._items];
  }

  int get itemCount {
    return _items.length;
  }

  void setCartItem(List<CartItem> cartItem) {
    _items = cartItem;
  }

// find the element by type in the cart
  int findByName(String name) {
    return _items.indexWhere((cartitem) => cartitem.product == name);
  }

// find the ID by index in the cart
  String getId(int index) {
    return _items[index].id;
  }

// getTotal amount for the items
  double getTotal() {
    var total = 0.0;
    _items.forEach((item) {
      total = total + item.price;
    });
    return total;
  }

// add items to the cart
  void addItem(CartItem newItem) {
    var index = _items.indexWhere((cart) => cart.product == newItem.product);
    if (index == -1) {
      _items.add(newItem);
    } else {
      _items[index].quantity++;
    }

    notifyListeners();
  }

// remove Items from the cart
  void removeItem(CartItem item) {
    var index = _items.indexWhere((cart) => cart.id == item.id);
    _items.removeAt(index);
    notifyListeners();
  }

// delete Items from the cart based on id
  void deleteItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

// clear the cart items
  void resetCart() {
    _items.clear();
    notifyListeners();
  }

// clear all the data
  void logout() async {
    _items.clear();
    notifyListeners();
  }
}
