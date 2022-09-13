import 'dart:convert';
import 'dart:developer';

import 'package:bitcoin_app/model/coin_model.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  String selectedCoin;
  String selectedCurrency;
  NetworkService({
    required this.selectedCoin,
    required this.selectedCurrency,
  });

  Future<http.Response> fetchData() async {
    final String apiKey =
        'https://rest.coinapi.io/v1/exchangerate/$selectedCoin/$selectedCurrency?apikey=ADD_API_HERE';
    try {
      http.Response data = await http.get(Uri.parse(apiKey));
      if (data.statusCode == 200) {
        log(data.body);
        return data;
      } else {
        throw Exception();
      }
    } catch (e) {
      log(e.toString());
      throw 'Failed to load';
    }
  }

  Future<CoinModel> getData() async {
    http.Response response = await fetchData();

    if (response.statusCode == 200) {
      return CoinModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }
}
