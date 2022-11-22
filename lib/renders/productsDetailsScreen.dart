import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/amountButton.dart';
import '../interfaces/cart.dart';
import '../interfaces/products.dart';
import '../services/cart.dart';
import '../services/products.dart';
import '../utils/constants.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int id;

  const ProductDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => setCardDetails(widget.id));
  }

  final Products productClass = Products();
  dynamic productDetails;
  int quantity = 1;
  final Cart cart = Cart();
  final String text = '';

  setCardDetails(int id) async {
    var product = await productClass.getSingleCard(id);
    setState(() {
      productDetails = product;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF020E8A),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            FadeInImage(
              image: NetworkImage(productDetails.image ?? text),
              placeholder: const AssetImage('images/dummyImage.png'),
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset('images/dummyImage.png',
                    fit: BoxFit.fitWidth);
              },
              height: 321,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      productDetails.title ?? text,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      productDetails.description ?? text,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\$125',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      AmountButton(
                        icon: kAddIcon,
                        onPressed: () {
                          setState(() {
                            if (quantity < 10) quantity++;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(quantity.toString(), style: kQuantityButton),
                      const SizedBox(
                        width: 7,
                      ),
                      AmountButton(
                        icon: kMinusIcon,
                        onPressed: () {
                          setState(() {
                            if (quantity != 0) quantity--;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        if (quantity > 0) {
                          cart.addToCart(
                            CartItems(
                                products: [CartProduct(productDetails.id, 1)],
                                userId: kUserId),
                          );
                          Navigator.pushNamed(context, '/cart');
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xFF0011A8),
                        ),
                      ),
                      child: const Text(
                        'Buy',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
