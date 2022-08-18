import 'package:flutter/material.dart';

class datePicker extends StatefulWidget {
  const datePicker({Key? key}) : super(key: key);

  @override
  State<datePicker> createState() => _datePickerState();
}

class _datePickerState extends State<datePicker> {
  @override
  DateTime _dateTime = DateTime.now();
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Time Picker'),
          backgroundColor: Color.fromARGB(255, 233, 176, 18),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_dateTime == null
                  ? 'Nothing has been picked yet '
                  : _dateTime.toString()),
              MaterialButton(
                child: Text('Pick a date'),
                onPressed: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2100))
                      .then((date) {
                    setState(() {
                      _dateTime = date!;
                    });
                  });
                },
                color: Color.fromARGB(255, 233, 176, 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
