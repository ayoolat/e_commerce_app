import 'package:e_commerce_app/interfaces/products.dart';
import 'package:e_commerce_app/services/products.dart';

import '../renders/cartScreen.dart';
import 'HttpsCalls.dart';
import '../interfaces/cart.dart';

class Cart {
  final HttpsCalls httpCalls = HttpsCalls();
  Products products = Products();

  Future<void> createCart(String userId, int productId) async {
    var product = CartProduct(productId, 1);
    var cart = CartItems([product], int.parse(userId));
    print(await httpCalls.addToCart(cart));
    return;
  }

  Future<List<CartProductCard>> getCart(String userId) async {
    var response = await httpCalls.getCart(userId);
    List<CartProductCard> cartProductCard = [];

    for (var product in response.products) {
      var cart = await products.getSingleCard(product.productId);
      cartProductCard.add(
        CartProductCard(
          image: cart.image,
          name: cart.title,
          amount: cart.price.toString(),
        ),
      );
    }
    ;

    return cartProductCard;
  }
}
