class CartItems {
  CartItems({required this.products, required this.userId});

  late int userId;
  late DateTime date = DateTime.now();
  late List<CartProduct> products;

  factory CartItems.fromJson(Map<String, dynamic> json) {
    List<CartProduct> products = [];
    json['products']
        .forEach((element) => products.add(CartProduct.fromJson(element)));
    return CartItems(products: products, userId: json['userId'] as int);
  }

  Map<String, dynamic> toJson() {
    return {'products': products, 'userId': userId};
  }
}

class CartProduct {
  late int productId;
  late int quantity;

  CartProduct(this.productId, this.quantity);
  factory CartProduct.fromJson(dynamic json) {
    return CartProduct(json['productId'] as int, json['quantity'] as int);
  }

  Map<String, dynamic> toJson() {
    return {'productId': productId, 'quantity': quantity};
  }
}
