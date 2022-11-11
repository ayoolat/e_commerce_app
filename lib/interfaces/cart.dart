class CartItems {
  CartItems(this.products, this.userId);

  late int userId;
  late DateTime date = DateTime.now();
  late List<CartProduct> products;

  factory CartItems.fromJson(Map<String, dynamic> json) {
    return CartItems(
        json['products'] as List<CartProduct>, json['userId'] as int);
  }

  Map<String, dynamic> toJson() {
    return {'products': products, 'userId': userId};
  }
}

class CartProduct {
  CartProduct(this.productId, this.quantity);

  late int productId;
  late int quantity;

  factory CartProduct.fromJson(dynamic json) {
    return CartProduct(json['productId'] as int, json['quantity'] as int);
  }

  Map<String, dynamic> toJson() {
    return {'productId': productId, 'quantity': quantity};
  }
}
