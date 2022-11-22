import '../interfaces/cart.dart';

class CartModel {
  static List<CartItems> cart = [];

  CartModel._privateConstructor();
  static final CartModel instance = CartModel._privateConstructor();

  CartModel.addToCart(CartItems cartItem) {
    cart.add(cartItem);
  }
}
