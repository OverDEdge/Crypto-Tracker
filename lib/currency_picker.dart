import 'package:flutter/material.dart';

class CurrencyPicker extends StatelessWidget {
  /*
  Class that creates a Currency Picker Widget and a Button Widget 
  aligned in a Column, at the bottom of an area.
  */

  final String currency;
  final Widget picker;
  final Function updateScreen;

  CurrencyPicker({this.currency, this.picker, this.updateScreen});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 140.0,
            alignment: Alignment.center,
            color: Theme.of(context).accentColor,
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                picker,
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: GestureDetector(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.teal[700],
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                          child: Text(
                        'Get Prices in $currency',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                    ),
                    onTap: updateScreen,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
