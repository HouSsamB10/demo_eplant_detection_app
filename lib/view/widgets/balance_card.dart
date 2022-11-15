import 'package:e_plant1/models/Compaign.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  Compaign cardData;
  BalanceCard({Key? key, required this.cardData});
  @override
  Widget build(BuildContext context) {
    print(cardData.image_url.toString());
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      //height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: NetworkImage(cardData.image_url.toString()),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
