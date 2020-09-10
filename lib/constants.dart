import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Icon kDropDownIcon = Icon(
  FontAwesomeIcons.wallet,
  color: Colors.white,
  size: 20.0,
);

double kDropDownTextSize = 20.0;
double kIOsPickerTextSize = 25.0;
double kLoadingCircleSize = 100.0;

// TODO: Fill out Nomics API Key
String kNomicsApiKey = '';
String kNomicsUrlBase = 'https://api.nomics.com/v1/currencies';

TextStyle kCryptoInfoTextStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
