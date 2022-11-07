import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/bestDealsCard.dart';
import '../components/bestProductsCard.dart';
import '../components/horizontalCard.dart';
import '../utils/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Flexible(
                    flex: 10,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Search Now',
                        fillColor: Color(0xFFE8E8E8),
                        isDense: true,
                        contentPadding: EdgeInsets.all(12.0),
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Flexible(
                    flex: 1,
                    child: Icon(
                      Icons.search,
                      color: Color(0xFF555555),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Home',
                    style: kCategoryText,
                  ),
                  Text(
                    'Chair',
                    style: kCategoryText,
                  ),
                  Text(
                    'Cupboard',
                    style: kCategoryText,
                  ),
                  Text(
                    'Table',
                    style: kCategoryText,
                  ),
                  Text(
                    'Accessory',
                    style: kCategoryText,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    HorizontalCard(
                      image: 'images/productImage.png',
                      name: 'Scotch Premium',
                      amount: '125',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    HorizontalCard(
                      image: 'images/productImage.png',
                      name: 'Scotch Premium',
                      amount: '125',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Best Deals',
                  textAlign: TextAlign.start,
                  style: kDashboardHeading,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const BestDealsCard(
                image: 'images/productImage.png',
                name: 'Scotch Premium',
                amount: '125',
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Best Products',
                  textAlign: TextAlign.start,
                  style: kDashboardHeading,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        BestProductsCard(
                          image: 'images/productImage.png',
                          name: "Special Shirt’s",
                          amount: '125',
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        BestProductsCard(
                          image: 'images/productImage.png',
                          name: "Special Shirt’s",
                          amount: '125',
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 20,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(8, 4),
            ),
          ],
          color: Colors.white,
        ),
      ),
    );
  }
}
