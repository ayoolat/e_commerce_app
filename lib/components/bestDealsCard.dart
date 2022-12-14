import 'package:e_commerce_app/components/sekelton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../renders/productsDetailsScreen.dart';
import '../utils/constants.dart';

class BestDealsCard extends StatelessWidget {
  final String image;
  final String name;
  final String amount;
  final int id;

  const BestDealsCard(
      {required this.image,
      required this.name,
      required this.amount,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      width: 334,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          kcardBoxShadow,
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: FadeInImage(
              image: NetworkImage(image),
              placeholder: AssetImage('images/dummyImage.png'),
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'images/dummyImage.png',
                  fit: BoxFit.fitWidth,
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      name,
                      style: kNameTextStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '\$$amount',
                      style: kAmountTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SizedBox(
              child: TextButton(
                style: kCardButtonStyle,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(id: id),
                    ),
                  );
                },
                child: const Text(
                  'See product',
                  style: kCardTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BestDealsCardSkeleton extends StatelessWidget {
  const BestDealsCardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      width: double.infinity,
      child: Row(
        children: [
          const Skeleton(
            width: 100,
            height: 76,
          ),
          const SizedBox(
            height: 76,
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Skeleton(
                width: 100,
                height: 10,
              ),
              SizedBox(
                height: 5,
              ),
              Skeleton(
                width: 30,
                height: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 76,
            width: 20,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Skeleton(
              width: 80,
              height: 30,
            ),
          )
        ],
      ),
    );
  }
}
