// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:developer';

import 'package:bitcoin_app/constants/constants.dart';
import 'package:bitcoin_app/model/coin_model.dart';
import 'package:bitcoin_app/product/coin_data.dart';
import 'package:bitcoin_app/service/coin_service.dart';
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
  CoinModel coinModel = CoinModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        width: double.infinity,
        child: CupertinoPicker(
          squeeze: 2,
          itemExtent: MediaQuery.of(context).size.height * 0.1,
          onSelectedItemChanged: (index) async {
            NetworkService service = NetworkService(
              selectedCoin: selectedCoin,
              selectedCurrency: selectedCurrency,
            );
            final value = await service.getData();
            setState(() {
              selectedCurrency = CoinData.currenciesList[index];
              coinModel = value;
              log(coinModel.rate.toString());
            });
          },
          children: [
            ...List.generate(
              CoinData.currenciesList.length,
              (index) => Center(
                child: Text(CoinData.currenciesList[index],
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
                  log(value.toString());
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
              '1${selectedCoin} = ${coinModel.rate?.toStringAsFixed(1)} ${selectedCurrency}',
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
