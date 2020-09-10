import 'package:bitcoin_ticker/crypto_card_text.dart';
import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  /*
  Class that creates a CyptoCard widget that displays the pricing
  information of a given coin, currency and value in a styled manner.
  */

  final String coin;
  final String value;
  final String currency;

  CryptoCard({this.coin, this.currency, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Theme.of(context).accentColor,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Row(
            children: [
              CryptoCardText(
                text: '1 $coin',
                flex: 3,
                alignment: TextAlign.left,
              ),
              CryptoCardText(
                text: '=',
                flex: 1,
                alignment: TextAlign.center,
              ),
              CryptoCardText(
                text: value,
                flex: 5,
                alignment: TextAlign.right,
              ),
              CryptoCardText(
                text: currency,
                flex: 2,
                alignment: TextAlign.right,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
