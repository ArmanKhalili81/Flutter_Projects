import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class showimage extends StatefulWidget {
  const showimage({Key? key}) : super(key: key);

  @override
  State<showimage> createState() => _showimageState();
}

class _showimageState extends State<showimage> {
  bool select = false;
  File? address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        shape: StadiumBorder(),
        title: Text("Image"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              ClipOval(
                child: Image(
                  image: AssetImage("assets/astron.jpg"),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ClipOval(
                child: Image.network(
                    "https://www.ledgerinsights.com/wp-content/uploads/2019/02/bmw-810x476.jpg"),
              ),
              SizedBox(
                height: 50,
              ),
              (address == null)
                  ? ElevatedButton(
                      onPressed: () => selectImages(),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(), fixedSize: Size(100, 40)),
                      child: Text("Choose"),
                    )
                  : GestureDetector(
                      onTap: () => selectImages(),
                      child: ClipOval(
                        child: Image.file(address!),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  Future selectImages() async {
    var permission = await Permission.photos.request();
    if (permission.isGranted) {
      try {
        var image = await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;
        setState(() {
          this.address = File(image.path);
        });
      } on PlatformException catch (e) {
        print(e);
      }
    }
  }
}
