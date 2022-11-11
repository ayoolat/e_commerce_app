import '../interfaces/cart.dart';
import '../interfaces/products.dart';

class Mapper {
  Product getSingleMappedResponse(Map<String, dynamic> jsonResponse) {
    return Product.fromJson(jsonResponse);
  }

  List<Product> getMappedResponse(List<dynamic> jsonResponse) {
    return List<Product>.from(
        jsonResponse.map((result) => Product.fromJson(result)).toList());
  }

  CartItems getMappedCartResponse(Map<String, dynamic> jsonResponse) {
    return CartItems.fromJson(jsonResponse);
  }

  List<CartProduct> getMappedAllCartProductResponse(
      List<dynamic> jsonResponse) {
    return List<CartProduct>.from(
        jsonResponse.map((result) => CartProduct.fromJson(result)).toList());
  }

  CartProduct getMappedCartProductResponse(Map<String, dynamic> jsonResponse) {
    return CartProduct.fromJson(jsonResponse);
  }
}
