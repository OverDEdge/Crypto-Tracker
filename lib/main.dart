import 'package:flutter/material.dart';

import 'package:bitcoin_ticker/loading_screen.dart';

/*
Crypto Market Cap & Pricing Data Provided By Nomics - "https://nomics.com"
*/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.teal,
          accentColor: Colors.teal[900],
          scaffoldBackgroundColor: Colors.teal),
      home: LoadingScreen(),
    );
  }
}
