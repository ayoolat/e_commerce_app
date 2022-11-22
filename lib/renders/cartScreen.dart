import 'package:e_commerce_app/interfaces/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/cartModel.dart';
import '../components/BottomNav.dart';
import '../components/amountButton.dart';
import '../services/cart.dart';
import '../utils/constants.dart';

class CartScreen extends StatefulWidget {
  final String id;
  final List<CartItems> cart;

  const CartScreen({Key? key, required this.id, required this.cart})
      : super(key: key);
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void initState() {
    super.initState();
    setCardDetails();
  }

  final Cart cartClass = Cart();
  List<CartProductCard> cartProductCards = [];
  int quantity = 1;

  incrementQuantity() {
    setState(() {
      if (quantity < 10) quantity++;
      print(quantity);
    });
  }

  decrementQuantity() {
    setState(() {
      if (quantity != 0) quantity--;
      print(quantity);
    });
  }

  setCardDetails() async {
    if (CartModel.cart.isEmpty) {
      Navigator.pushNamed(context, '/empty');
    } else {
      var cart = await cartClass.getCart(
          widget.id != '' ? widget.id : kUserId.toString(),
          incrementQuantity,
          decrementQuantity,
          quantity);
      setState(() {
        cartProductCards = cart;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
        child: Column(
          children: [
            const Text(
              'Cart Items.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(children: cartProductCards),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        CartModel.cart = [];
                      });
                      Navigator.pushNamed(context, '/empty');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xFF020E8A),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Proceed',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(
        userId: widget.id,
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String amount;
  final VoidCallback incrementQuantity;
  final VoidCallback decrementQuantity;
  int quantity = 1;

  CartProductCard({
    required this.image,
    required this.name,
    required this.amount,
    required this.decrementQuantity,
    required this.incrementQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              kcardBoxShadow,
            ],
          ),
          height: 147,
          width: double.infinity,
          child: Row(
            children: [
              Flexible(
                flex: 4,
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
              Flexible(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 5, 0, 0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: const [
                          Expanded(
                            child: Text(
                              'This is a brief description about what the product is all about so enjoy the process and enjoy it to the',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          AmountButton(
                            icon: kAddIcon,
                            onPressed: () {
                              incrementQuantity();
                              print('quantity');
                              print(quantity);
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
                              decrementQuantity();
                            },
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              '\$$amount',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30.0,
        )
      ],
    );
  }
}
