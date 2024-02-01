import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Currency {
  INR('₹'),
  USD('\$');

  const Currency(this.symbol);
  final String symbol;
}

class FilterScreen extends StatefulWidget {
  final bool showAsOn;
  final bool showCurrency;
  final bool showPortfolio;

  // Constructor with optional parameters
  const FilterScreen({
    this.showAsOn = true,
    this.showCurrency = true,
    this.showPortfolio = true,
  });

  @override
  _FilterScreenState createState() => _FilterScreenState();

  // Static method to show the bottom sheet
  static Future<void> showBottomSheet(BuildContext context,
      {bool showAsOn = true, bool showCurrency = true, bool showPortfolio = true}) async {
    return showModalBottomSheet(
      useSafeArea: true,
      isDismissible: true,
      isScrollControlled: false,
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return FilterScreen(
          showAsOn: showAsOn,
          showCurrency: showCurrency,
          showPortfolio: showPortfolio,
        );
      },
    );
  }
}

class _FilterScreenState extends State<FilterScreen> {
  late DateTime selectedDate;
  String selectedCurrency = '\$';
  int selectedChipIndex = 0; // Default currency

  @override
  void initState() {
    super.initState();
    // Set the default date to today
    selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  String _formattedDate(DateTime date) {
    return DateFormat('MMMM d, y').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.60,
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'Filters',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),

          // As On
          if (widget.showAsOn) ...[
            Text('As On'),
            Transform.translate(
              offset: Offset(0, -2.0),
              child: GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color.fromARGB(255, 129,127,131))),
                  ),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.event_note),
                      border: InputBorder.none,
                    ),
                    child: Text(
                      _formattedDate(selectedDate),
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
          ],

          // Currency
          if (widget.showCurrency) ...[
            Text('Currency'),
            Transform.translate(
              offset: Offset(0, -9.0),
              child: DropdownMenu<Currency>(
                inputDecorationTheme: const InputDecorationTheme(
                  border: UnderlineInputBorder(borderSide: BorderSide(color: const Color.fromARGB(255, 162,157,165))),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                ),
                initialSelection: Currency.USD,
                dropdownMenuEntries: [
                  for (final currency in Currency.values)
                    DropdownMenuEntry(label: currency.symbol, value: currency)
                ],
                onSelected: (value) {
                  if (value != null) {
                    setState(() {
                      selectedCurrency = value.symbol;
                    });
                  }
                },
                width: 110,
              ),
            ),
            SizedBox(height: 16.0),
          ],

          // Portfolio
          if (widget.showPortfolio) ...[
            Text('Portfolio'),
            SizedBox(height: 7.0),
            Wrap(
              spacing: 8.0,
              children: [
                for (int index = 0; index < filterChipLabels.length; index++)
                  FilterChipWidget(
                    label: filterChipLabels[index],
                    isSelected: index == selectedChipIndex,
                    onSelected: () {
                      setState(() {
                        selectedChipIndex = index;
                      });
                    },
                  ),
              ],
            ),
            SizedBox(height: 16.0),
          ],

          // Apply Button
          Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('APPLY'),
            ),
          ),
        ],
      ),
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  const FilterChipWidget({
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool selected) {
        if (selected) {
          onSelected();
        }
      },
    );
  }
}

final List<String> filterChipLabels = [
  'A001 - Advisory Service',
  'A002 - General Investments',
  'A003 - Execution Only',
];
