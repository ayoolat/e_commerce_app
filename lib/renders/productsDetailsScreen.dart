import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/amountButton.dart';
import '../utils/constants.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF020E8A),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            const Flexible(
              flex: 4,
              child: Image(
                image: AssetImage('images/productDetail2.jpg'),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Flexible(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Scotch Premium',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'This is a brief description about what the product is all about so enjoy the process and enjoy it to the fullest.',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w300,
                          ),
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
                        AmountButton(icon: kAddIcon),
                        const SizedBox(
                          width: 7,
                        ),
                        const Text('5', style: kQuantityButton),
                        const SizedBox(
                          width: 7,
                        ),
                        AmountButton(icon: kMinusIcon),
                      ],
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/cart');
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
