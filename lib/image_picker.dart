import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class imagePicker extends StatefulWidget {
  const imagePicker({Key? key}) : super(key: key);

  @override
  State<imagePicker> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<imagePicker> {
  File? _image;

  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 233, 176, 18),
        title: Text('Image Picker'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              _image != null
                  ? Stack(
                      children: [
                        Container(
                          child: new Image.file(
                            _image!,
                            width: 250.0,
                            height: 250.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 5.0,
                          child: InkWell(
                            child: Icon(
                              Icons.cancel,
                              size: 30,
                              color: Colors.red,
                            ),
                            onTap: () {
                              setState(
                                () {
                                  _image = null;
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  // ? Image.file(
                  //     _image!,
                  //     width: 250,
                  //     height: 250,
                  //     fit: BoxFit.cover,
                  //   )
                  : SizedBox(
                      height: 150,
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 70),
                        child: Container(
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20),
                          child: CircularProgressIndicator(
                            color: Color.fromARGB(255, 233, 176, 18),
                            value: 0.8,
                          ),
                        ),
                      )),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                    title: 'Pick from camera',
                    icon: Icons.camera,
                    onClick: () => getImage(ImageSource.camera)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                    title: 'Pick from gallery',
                    icon: Icons.image_outlined,
                    onClick: () => getImage(ImageSource.gallery)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget CustomButton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return Container(
    width: 200,
    height: 50,
    child: MaterialButton(
      color: Color.fromARGB(255, 233, 176, 18),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 20,
          ),
          Text(title),
        ],
      ),
      onPressed: onClick,
    ),
  );
}
