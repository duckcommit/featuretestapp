import 'package:flutter/material.dart';

class FilterOption {
  static Future<void> showFilterOptions(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.88,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Filters",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              // ... Rest of the code for filter options
            ],
          ),
        );
      },
      showDragHandle: true,
    );
  }
}
