import 'package:bitcoin_app/constants/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.appBarTitle),
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
              '1BTC = ?USD',
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
