import 'package:flutter/material.dart';

import 'package:bitcoin_ticker/constants.dart';

class CryptoCardText extends StatelessWidget {
  /*
  Class that creates a Widget with a given text and flex.
  */

  final String text;
  final int flex;
  final TextAlign alignment;

  CryptoCardText({this.text, this.flex, this.alignment});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: alignment,
        style: kCryptoInfoTextStyle,
        maxLines: 1,
      ),
    );
  }
}
