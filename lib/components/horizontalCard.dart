import 'package:e_commerce_app/components/sekelton.dart';
import 'package:e_commerce_app/interfaces/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import '../interfaces/products.dart';
import '../providers/cartData.dart';
import '../renders/cartScreen.dart';
import '../services/cart.dart';
import '../services/products.dart';
import '../utils/constants.dart';

class HorizontalCard extends StatelessWidget {
  final Products products = Products();
  final Cart cart = Cart();
  List<Product>? product = [];

  final String image;
  final String name;
  final String amount;
  final int id;

  HorizontalCard({
    required this.image,
    required this.name,
    required this.amount,
    required this.id,
    this.product,
  });

  renderPage(BuildContext context, String userId) {
    var cartData = CartData();
    if (cartData.returnCart().isEmpty) {
      Navigator.pushNamed(context, '/empty');
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              CartScreen(id: userId, cart: cartData.returnCart()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/details');
          },
          child: Container(
            height: 103.0,
            width: 274.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                kcardBoxShadow,
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 103.0,
                    width: 104.0,
                    child: FadeInImage(
                      image: NetworkImage(image),
                      placeholder: AssetImage('images/dummyImage.png'),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset('images/dummyImage.png',
                            fit: BoxFit.fitWidth);
                      },
                      height: 76,
                      width: 92,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: const SizedBox(
                            height: 28.0,
                            width: 28.0,
                            child: ColoredBox(
                              color: Color(0xFFF44336),
                              child: Icon(
                                Icons.monitor_heart,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            name,
                            style: kNameTextStyle,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '\$$amount',
                            style: kAmountTextStyle,
                            textAlign: TextAlign.end,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            height: 29,
                            width: 88,
                            child: TextButton(
                              onPressed: () {
                                String userId = kUserId.toString();
                                cart
                                    .addToCart(
                                      CartItems(
                                          products: [CartProduct(id, 1)],
                                          userId: kUserId),
                                    )
                                    .then((res) => renderPage(context, userId));
                              },
                              style: kCardButtonStyle,
                              child: const Text(
                                'Add to cart',
                                style: kCardTextStyle,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 18,
        )
      ],
    );
  }
}

class HorizontalCardsSkeleton extends StatelessWidget {
  const HorizontalCardsSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Skeleton(
          height: 103.0,
          width: 104.0,
        ),
        const SizedBox(height: 103.0, width: 20.0),
        Container(
          height: 104.0,
          width: 200.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Align(
                alignment: Alignment.topRight,
                child: Skeleton(
                  height: 28.0,
                  width: 28.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Skeleton(
                height: 10.0,
                width: 160.0,
              ),
              SizedBox(
                height: 8.0,
              ),
              Skeleton(
                height: 10.0,
                width: 90.0,
              ),
              SizedBox(
                height: 8.0,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Skeleton(
                  height: 35.0,
                  width: 75.0,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
