import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  String name = '';
  String email = '';
  String password = '';
  String phone_number = '';
  String address = '';

  SecondPage(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone_number,
      required this.address});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 233, 176, 18),
          title: Text('Next page'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Name : ${name}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Email : ${email}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Password : ${password}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Phone Number : ${phone_number}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Address : ${address}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    // Within the SecondRoute widget
                    onPressed: () {
                      //-------------------------------------Simple snackbar-------------------------------
                      // final snackBar =
                      //     SnackBar(content: Text('Back to home page!'));
                      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      //----------------------------------------Action snackbar----------------------------
                      final snackBar = SnackBar(
                        duration: Duration(days: 365),
                        content: Text('Back to home page!'),
                        action: SnackBarAction(
                          textColor: Color.fromARGB(255, 233, 176, 18),
                          label: 'Dismiss',
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pop(context);
                      return;
                    },
                    child: Text('Back'),
                    color: Color.fromARGB(255, 233, 176, 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
