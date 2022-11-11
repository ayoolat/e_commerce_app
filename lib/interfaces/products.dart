class Product {
  Product(this.price, this.title, this.image, this.category, this.description,
      this.id);

  late int id;
  late String title;
  late double price;
  late String description;
  late String category;
  late String image;

  factory Product.fromJson(dynamic json) {
    return Product(
        json['price'].toDouble(),
        json['title'] as String,
        json['image'] as String,
        json['category'] as String,
        json['description'] as String,
        json['id'] as int);
  }
}
