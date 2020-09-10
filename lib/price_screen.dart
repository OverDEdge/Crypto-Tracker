import 'package:bitcoin_ticker/crypto_card.dart';
import 'package:bitcoin_ticker/currency_picker.dart';
import 'package:bitcoin_ticker/price_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/constants.dart';

class PriceScreen extends StatefulWidget {
  final List<Map<String, String>> startPriceData;

  PriceScreen({this.startPriceData});

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String activeCurrency = 'USD';
  List<Map<String, String>> cryptoPriceData;

  @override
  void initState() {
    super.initState();

    updateUI(widget.startPriceData);
  }

  void updateUI(List<Map<String, String>> prices) {
    /*
    Method for updating UI with new pricing information in 'prices'

    In case 'prices' is null then display's Error message.
    */
    setState(() {
      if (prices == null) {
        activeCurrency = '';
        cryptoPriceData = [];
        for (int i = 0; i < cryptoList.length; i++) {
          cryptoPriceData.add({'Error': 'No Data'});
        }
        return;
      }
      cryptoPriceData = prices;
      activeCurrency = selectedCurrency;
    });
  }

  DropdownButton<String> getDropdownButton() {
    /*
    Method for creating the Drop Down Currency choices for the user.
    Creates a list of DropDownMenuItem's containing the currency String tag.
  
    Returns a DropdownButton containing the available currencies
    */

    List<DropdownMenuItem<String>> dropdownCurrencies = [];

    for (String currency in currenciesList) {
      dropdownCurrencies.add(
        DropdownMenuItem(
          child: Text(currency),
          value: currency,
        ),
      );
    }

    return DropdownButton<String>(
      dropdownColor: Colors.grey[900],
      style: TextStyle(
        fontSize: kDropDownTextSize,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      value: selectedCurrency,
      icon: kDropDownIcon,
      items: dropdownCurrencies,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
      },
    );
  }

  CupertinoPicker getCupertinoPicker() {
    /*
    Method for creating the Cupertino Picker Currency choices for the user.
    Creates a list of Text widgets containing the currency String tag.
    
    Returns a Cupertino Picker containing the available currencies
    */

    List<Text> pickerCurrencies = [];

    for (String currency in currenciesList) {
      pickerCurrencies.add(
        Text(
          currency,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      );
    }

    return CupertinoPicker(
      backgroundColor: Theme.of(context).accentColor,
      itemExtent: kIOsPickerTextSize,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
        });
      },
      children: pickerCurrencies,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '🤑 Coin Ticker',
          style: TextStyle(),
        ),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              child: ListView.builder(
                itemCount: cryptoList.length,
                itemBuilder: (context, index) {
                  return CryptoCard(
                    coin: cryptoPriceData[index].entries.toList()[0].key,
                    value: cryptoPriceData[index].entries.toList()[0].value,
                    currency: activeCurrency,
                  );
                },
              ),
            ),
          ),
          CurrencyPicker(
            currency: selectedCurrency,
            picker: Platform.isIOS ? getCupertinoPicker() : getDropdownButton(),
            updateScreen: () async {
              var newPrices =
                  await PriceModel().getPriceInCurrency(selectedCurrency);
              updateUI(newPrices);
            },
          ),
        ],
      ),
    );
  }
}

/*

*/
