import 'package:flutter/material.dart';

class timepicker extends StatefulWidget {
  const timepicker({Key? key}) : super(key: key);

  @override
  State<timepicker> createState() => _timepickerState();
}

class _timepickerState extends State<timepicker> {
  @override
  TimeOfDay time = TimeOfDay.now();
  TimeOfDay picked = TimeOfDay.now();
  TimeOfDay _currentTime = TimeOfDay.now();

  void initState() {
    super.initState();
    time = TimeOfDay.now();
  }

  Future<Null> selectTime(BuildContext context) async {
    TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _currentTime);
    if (picked != null) {
      setState(() {
        time = picked;
      });
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
        centerTitle: true,
        title: Text('Time Picker'),
        backgroundColor: Color.fromARGB(255, 233, 176, 18),
      )),
    );
  }
}
