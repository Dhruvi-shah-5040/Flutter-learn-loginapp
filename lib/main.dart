//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temp/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:temp/image_picker.dart';
//import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temp/secondPage.dart';
import 'package:temp/date_picker.dart';
import 'package:temp/time_picker.dart';
import 'package:temp/about_us.dart';

void main() {
  runApp(MaterialApp(home: const MyApp()));
}

enum genderGroup { male, female, other }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool valuefirst = false;
  bool valuesecond = false;
  bool isHiddenPassword = true;
  bool switchValue = false;
  genderGroup _value = genderGroup.female;
  onSwitchValueChanged(bool newVal) {
    setState(() {
      switchValue = newVal;
    });
  }

  // String _name = '';
  // String _email = '';
  // String _phone = '';
  TextEditingController _name = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _phone_number = new TextEditingController();
  TextEditingController _address = new TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;

    return ScreenUtilInit(
      builder: (BuildContext context, child) => Scaffold(
        // backgroundColor: Color.fromARGB(255, 15, 12, 2),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Login',
            // style: TextStyle(backgroundColor: Colors.yellow),
          ),
          backgroundColor: Color.fromARGB(255, 233, 176, 18),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text("About us"),
                  value: 1,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => aboutUs()));
                  },
                ),
                PopupMenuItem(
                  child: Text("Log Out"),
                  value: 2,
                )
              ],
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                color: Color.fromARGB(255, 233, 176, 18),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: 100.h,
                        width: 100.w,
                        margin: EdgeInsets.only(top: 30, bottom: 15),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821_960_720.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Text(
                        'Dhruvi Shah',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'dhruvishah5040@gmail.com',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Switch(
                  value: switchValue,
                  onChanged: (newVal) {
                    onSwitchValueChanged(newVal);
                  },
                ),
                title: Text('Switch'),
                tileColor: Color.fromARGB(255, 252, 225, 91),
              ),
              ListTile(
                leading: Icon(Icons.date_range),
                title: Text('Date Picker'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => datePicker()));
                },
              ),
              ListTile(
                leading: Icon(Icons.timer),
                title: Text('Time Picker'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => timepicker()));
                },
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Image Picker'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => imagePicker()));
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: null,
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('About us'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => aboutUs()));
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formkey,
            child: Column(
              children: [
                Text("This device is $screenwidth x $screenheight"),
                Container(
                  child: Image(
                    image: AssetImage('assets/LandscapeColor.jpg'),
                  ),
                  // child: Image(
                  //   fit: BoxFit.contain,
                  //   image: NetworkImage(
                  //       'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821_960_720.jpg'),
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: screenwidth <= 400
                      ? Container(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Login ',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 233, 176, 18),
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Name : ',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        SizedBox(
                                          height: 50.h,
                                          width: 200.w,
                                          child: TextFormField(
                                            controller: _name,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              icon: Icon(Icons.people),
                                              hintText: 'Enter Your Name',
                                            ),
                                            validator: (String? value) {
                                              if (value?.isEmpty ?? true) {
                                                return "Please enter name";
                                              }
                                              return null;
                                            },
                                            onSaved: (String? name) {
                                              String? _name = name;
                                            },
                                          ),
                                        ),
                                      ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Email : ',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 50.h,
                                          width: 200.w,
                                          child: TextFormField(
                                            controller: _email,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              icon: Icon(Icons.email),
                                              hintText: 'Enter Your email',
                                            ),
                                            validator: (String? value) {
                                              if (value?.isEmpty ?? true) {
                                                return "Please enter email";
                                              }
                                              // RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
                                              if (!value!.contains('@')) {
                                                return 'Please enter a valid email';
                                              }
                                              if (!value.contains('.com')) {
                                                return 'Please enter a valid email';
                                              }
                                              return null;
                                            },
                                            onSaved: (String? email) {
                                              String? _email = email;
                                            },
                                          ),
                                        ),
                                      ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Password : ',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 50.h,
                                          width: 200.w,
                                          child: TextFormField(
                                            controller: _password,
                                            obscureText: isHiddenPassword,
                                            decoration: InputDecoration(
                                              icon: InkWell(
                                                child: Icon(isHiddenPassword
                                                    ? Icons.visibility
                                                    : Icons.visibility_off),
                                                // onLongPress: _togglePasswordView,
                                                onTap: _togglePasswordView,
                                              ),
                                              hintText: 'Enter Your password',
                                              //suffixIcon: Icon(Icons.visibility),
                                            ),
                                            validator: (String? value) {
                                              if (value?.isEmpty ?? true) {
                                                return "Please enter password";
                                              }
                                              if (value!.length < 6) {
                                                return "Password must be at least 6 characters ";
                                              }
                                              return null;
                                            },
                                            onSaved: (String? password) {
                                              String? _password = password;
                                            },
                                          ),
                                        ),
                                      ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Number : ',
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 50.h,
                                          width: 200.w,
                                          child: TextFormField(
                                            controller: _phone_number,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              icon: Icon(Icons.numbers),
                                              hintText: 'Enter Your Number',
                                            ),
                                            validator: (String? value) {
                                              if (value?.isEmpty ?? true) {
                                                return "Please enter Number";
                                              }
                                              if (value!.length != 10) {
                                                return 'Please enter correct 10 digit number';
                                              }
                                              if (value.contains('.')) {
                                                return 'Please enter correct number';
                                              }
                                              if (value.contains('-')) {
                                                return 'Please enter correct number';
                                              }
                                              return null;
                                            },
                                            onSaved: (String? number) {
                                              String? _number = number;
                                            },
                                          ),
                                        ),
                                      ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Address : ',
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 50..h,
                                        width: 200.w,
                                        child: TextFormField(
                                          controller: _address,
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 4,
                                          decoration: InputDecoration(
                                            icon: Icon(Icons.location_city),
                                            hintText: 'Enter Your Address',
                                          ),
                                          validator: (String? value) {
                                            if (value?.isEmpty ?? true) {
                                              return "Please enter address";
                                            }
                                            return null;
                                          },
                                          onSaved: (String? address) {
                                            String? _address = address;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    //mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Text('Gender : ',
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      SizedBox(
                                        height: 168.h,
                                        width: 200.w,
                                        child: Column(
                                          //mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            RadioListTile(
                                              value: genderGroup.male,
                                              title: Text('Male'),
                                              groupValue: _value,
                                              onChanged: (genderGroup? val) {
                                                setState(() {
                                                  _value = val!;
                                                });
                                              },
                                            ),
                                            RadioListTile(
                                              value: genderGroup.female,
                                              title: Text('Female'),
                                              groupValue: _value,
                                              onChanged: (genderGroup? val) {
                                                setState(() {
                                                  _value = val!;
                                                });
                                              },
                                            ),
                                            RadioListTile(
                                              value: genderGroup.other,
                                              title: Text('Other'),
                                              groupValue: _value,
                                              onChanged: (genderGroup? val) {
                                                setState(() {
                                                  _value = val!;
                                                });
                                              },
                                            ),
                                            //Text('Female'),
                                            //Text('Others'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 80),
                                        child: Text('Hobbies : ',
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      SizedBox(
                                        height: 120.h,
                                        width: 200.w,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Checkbox(
                                                  checkColor: Colors.white,
                                                  activeColor: Color.fromARGB(
                                                      255, 233, 176, 18),
                                                  value: this.valuefirst,
                                                  onChanged: (bool? value) {
                                                    setState(
                                                      () {
                                                        this.valuefirst =
                                                            value!;
                                                      },
                                                    );
                                                  },
                                                ),
                                                Text('Reading')
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Checkbox(
                                                  checkColor: Colors.white,
                                                  activeColor: Color.fromARGB(
                                                      255, 233, 176, 18),
                                                  value: this.valuesecond,
                                                  onChanged: (bool? value) {
                                                    setState(
                                                      () {
                                                        this.valuesecond =
                                                            value!;
                                                      },
                                                    );
                                                  },
                                                ),
                                                Text('Dancing')
                                              ],
                                            ),
                                          ],
                                        ),
                                        //Text('checkBox'),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: MaterialButton(
                                    onPressed: () {
                                      if (_formkey.currentState!.validate()) {
                                        showAlertDialg(context);

                                        return;
                                      } else {
                                        print('Unsuccessfull');
                                      }
                                    },
                                    child: Text('Submit'),
                                    color: Color.fromARGB(255, 233, 176, 18),
                                  ),
                                )
                              ],
                            ),
                          ),
                          height: 750.h,
                          width: 350.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                            ],
                          ),
                        )
                      : Container(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Login ',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 233, 176, 18),
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Name : ',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        SizedBox(
                                          height: 100.h,
                                          width: 200.w,
                                          child: TextFormField(
                                            controller: _name,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              icon: Icon(Icons.people),
                                              hintText: 'Enter Your Name',
                                            ),
                                            validator: (String? value) {
                                              if (value?.isEmpty ?? true) {
                                                return "Please enter name";
                                              }
                                              return null;
                                            },
                                            onSaved: (String? name) {
                                              String? _name = name;
                                            },
                                          ),
                                        ),
                                      ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Email : ',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 100.h,
                                          width: 200.w,
                                          child: TextFormField(
                                            controller: _email,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              icon: Icon(Icons.email),
                                              hintText: 'Enter Your email',
                                            ),
                                            validator: (String? value) {
                                              if (value?.isEmpty ?? true) {
                                                return "Please enter email";
                                              }
                                              // RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
                                              if (!value!.contains('@')) {
                                                return 'Please enter a valid email';
                                              }
                                              if (!value.contains('.com')) {
                                                return 'Please enter a valid email';
                                              }
                                              return null;
                                            },
                                            onSaved: (String? email) {
                                              String? _email = email;
                                            },
                                          ),
                                        ),
                                      ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Password : ',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 100.h,
                                          width: 200.w,
                                          child: TextFormField(
                                            controller: _password,
                                            obscureText: isHiddenPassword,
                                            decoration: InputDecoration(
                                              icon: InkWell(
                                                child: Icon(isHiddenPassword
                                                    ? Icons.visibility
                                                    : Icons.visibility_off),
                                                // onLongPress: _togglePasswordView,
                                                onTap: _togglePasswordView,
                                              ),
                                              hintText: 'Enter Your password',
                                              //suffixIcon: Icon(Icons.visibility),
                                            ),
                                            validator: (String? value) {
                                              if (value?.isEmpty ?? true) {
                                                return "Please enter password";
                                              }
                                              if (value!.length < 6) {
                                                return "Password must be at least 6 characters ";
                                              }
                                              return null;
                                            },
                                            onSaved: (String? password) {
                                              String? _password = password;
                                            },
                                          ),
                                        ),
                                      ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Number : ',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 100.h,
                                          width: 200.w,
                                          child: TextFormField(
                                            controller: _phone_number,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              icon: Icon(Icons.numbers),
                                              hintText: 'Enter Your Number',
                                            ),
                                            validator: (String? value) {
                                              if (value?.isEmpty ?? true) {
                                                return "Please enter Number";
                                              }
                                              if (value!.length != 10) {
                                                return 'Please enter correct 10 digit number';
                                              }
                                              if (value.contains('.')) {
                                                return 'Please enter correct number';
                                              }
                                              if (value.contains('-')) {
                                                return 'Please enter correct number';
                                              }
                                              return null;
                                            },
                                            onSaved: (String? number) {
                                              String? _number = number;
                                            },
                                          ),
                                        ),
                                      ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Address : ',
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 100..h,
                                        width: 200.w,
                                        child: TextFormField(
                                          controller: _address,
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 4,
                                          decoration: InputDecoration(
                                            icon: Icon(Icons.location_city),
                                            hintText: 'Enter Your Address',
                                          ),
                                          validator: (String? value) {
                                            if (value?.isEmpty ?? true) {
                                              return "Please enter address";
                                            }
                                            return null;
                                          },
                                          onSaved: (String? address) {
                                            String? _address = address;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    //mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Text('Gender : ',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      SizedBox(
                                        height: 310.h,
                                        width: 200.w,
                                        child: Column(
                                          //mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            RadioListTile(
                                              value: genderGroup.male,
                                              title: Text('Male'),
                                              groupValue: _value,
                                              onChanged: (genderGroup? val) {
                                                setState(() {
                                                  _value = val!;
                                                });
                                              },
                                            ),
                                            RadioListTile(
                                              value: genderGroup.female,
                                              title: Text('Female'),
                                              groupValue: _value,
                                              onChanged: (genderGroup? val) {
                                                setState(() {
                                                  _value = val!;
                                                });
                                              },
                                            ),
                                            RadioListTile(
                                              value: genderGroup.other,
                                              title: Text('Other'),
                                              groupValue: _value,
                                              onChanged: (genderGroup? val) {
                                                setState(() {
                                                  _value = val!;
                                                });
                                              },
                                            ),
                                            //Text('Female'),
                                            //Text('Others'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 80),
                                        child: Text('Hobbies : ',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      SizedBox(
                                        height: 200.h,
                                        width: 200.w,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Checkbox(
                                                  checkColor: Colors.white,
                                                  activeColor: Color.fromARGB(
                                                      255, 233, 176, 18),
                                                  value: this.valuefirst,
                                                  onChanged: (bool? value) {
                                                    setState(
                                                      () {
                                                        this.valuefirst =
                                                            value!;
                                                      },
                                                    );
                                                  },
                                                ),
                                                Text('Reading')
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Checkbox(
                                                  checkColor: Colors.white,
                                                  activeColor: Color.fromARGB(
                                                      255, 233, 176, 18),
                                                  value: this.valuesecond,
                                                  onChanged: (bool? value) {
                                                    setState(
                                                      () {
                                                        this.valuesecond =
                                                            value!;
                                                      },
                                                    );
                                                  },
                                                ),
                                                Text('Dancing')
                                              ],
                                            ),
                                          ],
                                        ),
                                        //Text('checkBox'),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: MaterialButton(
                                    onPressed: () {
                                      if (_formkey.currentState!.validate()) {
                                        showAlertDialg(context);

                                        return;
                                      } else {
                                        print('Unsuccessfull');
                                      }
                                    },
                                    child: Text('Submit'),
                                    color: Color.fromARGB(255, 233, 176, 18),
                                  ),
                                )
                              ],
                            ),
                          ),
                          height: 1500.h,
                          width: 350.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    // if (ishiddenPassword == true) {
    //   ishiddenPassword = false;
    // } else {
    //   ishiddenPassword = true;
    // }

    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  void showAlertDialg(BuildContext context) {
    Widget onPositiveButton = TextButton(
      onPressed: () {
        Fluttertoast.showToast(msg: "Successfully submitted....");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondPage(
              name: _name.text,
              email: _email.text,
              password: _password.text,
              phone_number: _phone_number.text,
              address: _address.text,
            ),
          ),
        );
      },
      child: Text('Yes'),
    );
    Widget onNegativeButton = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text('No'),
    );
    AlertDialog dialog = new AlertDialog(
      actions: [onPositiveButton, onNegativeButton],
      title: Text("Do you really want to submit?"),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }
}
