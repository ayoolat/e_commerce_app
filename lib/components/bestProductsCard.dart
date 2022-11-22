import 'package:e_commerce_app/components/sekelton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../renders/productsDetailsScreen.dart';
import '../services/products.dart';
import '../utils/constants.dart';

class BestProductsCard extends StatelessWidget {
  final Products productClass = Products();
  final String image;
  final String name;
  final String amount;
  final int id;

  BestProductsCard(
      {required this.image,
      required this.name,
      required this.amount,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(id: id),
              ),
            );
          },
          child: Container(
            width: 147,
            height: 213,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                kcardBoxShadow,
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 130,
                  width: 147,
                  child: FadeInImage(
                    image: NetworkImage(image),
                    placeholder: const AssetImage('images/dummyImage.png'),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset('images/dummyImage.png',
                          fit: BoxFit.fitWidth);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 6,
                        child: Column(
                          children: [
                            Text(
                              name,
                              style: kNameTextStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '\$$amount',
                                style: kAmountTextStyle,
                                textAlign: TextAlign.left,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Expanded(
                        flex: 4,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.thumb_up,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 40,
        )
      ],
    );
  }
}

class BestProductsCardSkeleton extends StatelessWidget {
  const BestProductsCardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Skeleton(
          height: 130,
          width: 177,
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Skeleton(
                  height: 10,
                  width: 70,
                ),
                SizedBox(
                  height: 10,
                ),
                Skeleton(
                  height: 10,
                  width: 30,
                ),
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            const Skeleton(
              height: 25,
              width: 40,
            ),
          ],
        )
      ],
    );
  }
}
