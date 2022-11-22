import 'package:e_commerce_app/services/products.dart';

import '../Models/cartModel.dart';
import '../providers/cartData.dart';
import '../renders/cartScreen.dart';
import 'HttpsCalls.dart';
import '../interfaces/cart.dart';

class Cart {
  final HttpsCalls httpCalls = HttpsCalls();
  Products products = Products();

  Future<void> addToCart(CartItems cartItem) async {
    CartData cartData = CartData();
    CartModel.addToCart(cartItem);
    List<CartItems> cart = cartData.returnCart();
    await httpCalls.addToCart(cart[cart.length - 1]);
    return;
  }

  Future<List<CartProductCard>> getCart(String userId, dynamic incrementButton,
      dynamic decrementButton, int quantity) async {
    var response = await httpCalls.getCart('2');
    List<CartProductCard> cartProductCard = [];

    for (var product in response.products) {
      var cart = await products.getSingleCard(product.productId);
      cartProductCard.add(
        CartProductCard(
          image: cart.image,
          name: cart.title,
          amount: cart.price.toString(),
          incrementQuantity: incrementButton,
          decrementQuantity: decrementButton,
        ),
      );
    }
    ;
    return cartProductCard;
  }
}
