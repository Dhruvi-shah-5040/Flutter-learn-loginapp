import 'package:flutter/material.dart';

class aboutUs extends StatelessWidget {
  const aboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 233, 176, 18),
        title: Text('About us'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text("About us...."),
        ),
      ),
    );
  }
}
