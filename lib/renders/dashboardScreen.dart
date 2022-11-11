import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/BottomNav.dart';
import '../components/DashboardAppBar.dart';
import '../components/bestDealsCard.dart';
import '../components/bestProductsCard.dart';
import '../components/horizontalCard.dart';
import '../interfaces/products.dart';
import '../services/products.dart';
import '../utils/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    setHorizontalCardsObject();
    setBestDealsCard();
    setBestProductsCard();
  }

  final Products productClass = Products();
  List<HorizontalCard> horizontalCards = [];
  BestDealsCard? bestDealsCard;
  List<BestProductsCard> bestProductsCard = [];

  Future setHorizontalCardsObject() async {
    var cards = await productClass.getHorizontalCards();
    setState(() {
      horizontalCards = cards;
    });
  }

  Future setBestDealsCard() async {
    var card = await productClass.getBestDealsCard();
    setState(() {
      bestDealsCard = card;
    });
  }

  Future setBestProductsCard() async {
    var card = await productClass.getBestProductsCard();
    setState(() {
      bestProductsCard = card;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: DashboardAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
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
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: horizontalCards,
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
            Container(
              child: bestDealsCard,
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: bestProductsCard,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
