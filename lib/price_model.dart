import 'package:bitcoin_ticker/constants.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/networking.dart';

class PriceModel {
  /*
  Class that is used to retrieve prices for crypto coins in a chosen currency. 
  */

  Future<List<Map<String, String>>> getPriceInCurrency(
      String selectedCurrency) async {
    /*
    Method that creates a Query for Nomics API and retrieves the crypto prices
    in a chosen currency

    Returns a list of Maps with: 
    'Crypto ticker': 'Crypto price in chosen currency'
    */

    String cryptoQuery = '';
    List<Map<String, String>> priceData;

    for (String crypto in cryptoList) {
      cryptoQuery += crypto + ',';
    }

    cryptoQuery = cryptoQuery.substring(0, cryptoQuery.length - 1);

    NetworkHelper networkHelper = NetworkHelper(
        '$kNomicsUrlBase/ticker?key=$kNomicsApiKey&ids=$cryptoQuery&interval=1d&convert=$selectedCurrency');

    // Get pricing data
    var data = await networkHelper.getData();

    // Checks if data has been correctly retrieved
    if (data != null) {
      priceData = [];
      // Create List of Maps with Crypto ticker connected to the price in chosen currency
      for (var cryptoData in data) {
        priceData.add(
          {
            cryptoData['id']:
                double.parse(cryptoData['price']).toStringAsFixed(2)
          },
        );
      }
    }

    // Return List of Maps with price data
    return priceData;
  }
}
