import 'package:flutter/material.dart';
import 'filter_option.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              FilterScreen.showBottomSheet(
                context,
                showAsOn: true,
                showCurrency: true,
                showPortfolio: true,
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Content Content Content'),
      ),
    );
  }
}
