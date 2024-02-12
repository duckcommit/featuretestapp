import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:intl/intl.dart';

class PageWrapper extends StatelessWidget implements PreferredSizeWidget {
  final String pageTitle;
  final String portfolioName;
  final DateTime currentDate;
  final String currencyCode;

  PageWrapper({
    required this.pageTitle,
    required this.portfolioName,
    required this.currentDate,
    required this.currencyCode,
  });

  @override
  Size get preferredSize => AppBar().preferredSize;

  String formattedCustomerName() {
    String formattedDate = DateFormat('d MMM y').format(currentDate);
    return 'As on $formattedDate || $currencyCode';
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pageTitle,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            portfolioName,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Text(
            formattedCustomerName(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Ionicons.options_outline),
          onPressed: () {
            // Handle filter icon press
          },
        ),
        IconButton(
          icon: Icon(Ionicons.menu_outline),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
      ],
    );
  }
}
