import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRangePickerScreen extends StatefulWidget {
  @override
  _DateRangePickerScreenState createState() => _DateRangePickerScreenState();
}

class _DateRangePickerScreenState extends State<DateRangePickerScreen> {
  DateTimeRange dateRange;

  String getFrom() {
    if (dateRange == null) {
      return 'From';
    } else {
      return DateFormat('dd/MM/yyyy').format(dateRange.start);
    }
  }

  String getTo() {
    if (dateRange == null) {
      return 'To';
    } else {
      return DateFormat('dd/MM/yyyy').format(dateRange.end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Date Range")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
                child: MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () => pickDateRange(context),
              child: Text(getFrom()),
            )),
            const SizedBox(width: 8),
            Icon(Icons.arrow_forward, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
                child: MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () => pickDateRange(context),
              child: Text(getTo()),
            )),
          ],
        ),
      ),
    );
  }

  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now(),
    );
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime.now(),
      initialDateRange: dateRange ?? initialDateRange,
    );

    if (newDateRange == null) return;

    setState(() => dateRange = newDateRange);
  }
}
