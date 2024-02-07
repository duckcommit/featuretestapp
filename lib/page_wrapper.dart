import 'package:flutter/material.dart';
import 'package:investment_app/shared/components/widget_filter/view/widget.filter.dart';

class PageWrapper extends StatelessWidget {
  final String pageTitle;
  final String portfolioName;
  final String customerName;
  final void Function(dynamic)? onFilterChanged;
  final Map<String, dynamic> filterItems;

  PageWrapper({
    super.key,
    required this.pageTitle,
    required this.portfolioName,
    required this.customerName,
    this.onFilterChanged,
    required this.filterItems,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pageTitle,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.background,
                  fontWeight: FontWeight.w700,
                ),
          ),
          Text(
            portfolioName,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            customerName,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.filter_list),
          onPressed: () {
            // Handle filter button press
            if (onFilterChanged != null) {
              onFilterChanged!(/* Pass necessary parameters */);
            }
          },
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            // Handle settings button press
            // Add your implementation here
          },
        ),
      ],
    );
  }
}
