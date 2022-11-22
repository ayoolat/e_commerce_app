import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../Models/cartModel.dart';
import '../interfaces/cart.dart';

class CartData extends ChangeNotifier {
  final List<CartItems> _cart = CartModel.cart;

  returnCart() {
    var cart = _cart;
    print(_cart.length);
    return cart;
  }

  UnmodifiableListView<CartItems> get cart {
    return UnmodifiableListView(_cart);
  }
}
