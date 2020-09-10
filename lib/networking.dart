import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class NetworkHelper {
  String url;

  NetworkHelper(this.url);

  Future getData() async {
    /*
    Method used for making an http request to an API
    If not a correct response then prints the error to console.
    */

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
