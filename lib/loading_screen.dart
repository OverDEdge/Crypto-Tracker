import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:bitcoin_ticker/price_screen.dart';
import 'package:bitcoin_ticker/price_model.dart';
import 'package:bitcoin_ticker/constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getCurrenciesPricesData();
  }

  void getCurrenciesPricesData() async {
    /*
    Method for retrieving initial prices in starting currency 'USD' for the
    crypto coins.

    After retrival user is pushed to the PriceScreen where the values are displayed.
    */
    var cryptoPrices = await PriceModel().getPriceInCurrency('USD');

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return PriceScreen(
          startPriceData: cryptoPrices,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: kLoadingCircleSize,
        ),
      ),
    );
  }
}
