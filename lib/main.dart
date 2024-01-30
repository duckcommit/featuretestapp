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
        title: Text('Filter App'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              FilterScreen.showBottomSheet(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Main Screen Content'),
      ),
    );
  }
}
