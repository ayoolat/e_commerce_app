import 'package:e_commerce_app/interfaces/products.dart';

import '../components/bestDealsCard.dart';
import '../components/bestProductsCard.dart';
import '../components/horizontalCard.dart';
import 'dart:math';

import 'HttpsCalls.dart';

class Products {
  List<HorizontalCard> horizontalCards = [];
  BestDealsCard? bestDealsCard;
  List<BestProductsCard> bestProductsCard = [];
  final HttpsCalls httpCalls = HttpsCalls();

  Future<BestDealsCard> getBestDealsCard() async {
    Random random = Random();
    var id = random.nextInt(6) + 1;
    var products = await httpCalls.getRandomProducts(id.toString());
    return BestDealsCard(
        image: products.image,
        name: products.title,
        amount: products.price.toString(),
        id: products.id);
  }

  Future<Product> getSingleCard(int id) async {
    var products = await httpCalls.getRandomProducts(id.toString());
    return products;
  }

  Future<List<BestProductsCard>> getBestProductsCard() async {
    Random random = Random();
    int limit = random.nextInt(6) + 2;
    var products = await httpCalls.getAllProductsLimit(limit);
    products?.forEach(
      (product) {
        bestProductsCard.add(
          BestProductsCard(
            image: product.image,
            name: product.title,
            amount: product.price.toString(),
            id: product.id,
          ),
        );
      },
    );
    return bestProductsCard;
  }

  Future<List<HorizontalCard>> getHorizontalCards() async {
    var products = await httpCalls.getProductsByCategory('jewelery');

    products?.forEach((product) {
      horizontalCards.add(
        HorizontalCard(
          image: product.image,
          name: product.title,
          amount: product.price.toString(),
          id: product.id,
        ),
      );
    });

    return horizontalCards;
  }
}
