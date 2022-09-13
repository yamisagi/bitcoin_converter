import 'dart:developer';

import 'package:bitcoin_app/constants/constants.dart';
import 'package:bitcoin_app/product/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCoin = 'BTC';

  String selectedCurrency = CoinData.currenciesList[19];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        width: double.infinity,
        child: CupertinoPicker(
          squeeze: 2,
          itemExtent: MediaQuery.of(context).size.height * 0.1,
          onSelectedItemChanged: (index) {
            setState(() {
              selectedCurrency = CoinData.currenciesList[index];
              log('selectedCurrency: $index');
            });
          },
          children: [
            ...List.generate(
              CoinData.currenciesList.length,
              (index) => Center(
                child: Text(selectedCurrency,
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(Constants.appBarTitle),
        actions: [
          Padding(
            padding: Constants.padding,
            child: DropdownButton(
              enableFeedback: false,
              underline: Container(),
              icon: const Icon(Icons.more_vert),
              alignment: Alignment.center,
              value: selectedCoin,
              items: [
                ...List.generate(
                  CoinData.cryptoList.length,
                  (index) => DropdownMenuItem(
                    value: CoinData.cryptoList[index],
                    child: Text(CoinData.cryptoList[index]),
                  ),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedCoin = value ?? 'Unknown';
                });
              },
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: Constants.globalMargin,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey.withOpacity(0.2),
                  Colors.black.withOpacity(0.4),
                ],
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Text(
              '1$selectedCoin = ? $selectedCurrency',
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
