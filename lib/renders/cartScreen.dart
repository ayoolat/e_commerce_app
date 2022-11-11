import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/BottomNav.dart';
import '../components/amountButton.dart';
import '../services/cart.dart';
import '../utils/constants.dart';

class CartScreen extends StatefulWidget {
  final String id;

  const CartScreen({Key? key, required this.id}) : super(key: key);
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

  checkCards(List<CartProductCard> cart) {
    if (cart.isEmpty) {
      Navigator.pushNamed(context, '/empty');
    }
  }

  setCardDetails() async {
    print('widget.id');
    print(widget.id);
    var cart = await cartClass
        .getCart(widget.id != '' ? widget.id : kUserId.toString());
    checkCards(cart);
    setState(() {
      cartProductCards = cart;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 0, 30),
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
                      cartProductCards = [];
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
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String amount;

  const CartProductCard(
      {required this.image, required this.name, required this.amount});

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
                  padding: const EdgeInsets.all(5.0),
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
                            onPressed: () {},
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Text('5', style: kQuantityButton),
                          const SizedBox(
                            width: 7,
                          ),
                          AmountButton(icon: kMinusIcon, onPressed: () {}),
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
