import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late DateTime selectedDate;

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

          // As On and Currency
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // As On
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('As On'),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey)),
                      ),
                      child: Text(
                        _formattedDate(selectedDate),
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              ),

              // Currency
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Currency'),
                  // Add your dropdown widget here
                  // Example: DropdownWidget(),
                ],
              ),
            ],
          ),

          SizedBox(height: 16.0),

          // Third Filter Portfolio
          Text('Third Filter Portfolio'),

          // Chip List
          Wrap(
            spacing: 8.0,
            children: [
              FilterChipWidget(label: 'A001'),
              FilterChipWidget(label: 'A002'),
              FilterChipWidget(label: 'A003'),
            ],
          ),
        ],
      ),
    );
  }
}


class FilterChipWidget extends StatefulWidget {
  final String label;

  const FilterChipWidget({required this.label});

  @override
  _FilterChipWidgetState createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.label),
      selected: isSelected,
      onSelected: (bool selected) {
        setState(() {
          isSelected = selected;
        });
      },
    );
  }
}