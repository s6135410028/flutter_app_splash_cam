import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({ Key? key }) : super(key: key);

  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  File? selectImage;

  //Method เปิดกล้อง
  Future selectImageFormCamera() async{
    //open camera
    var img = await ImagePicker().pickImage(source: ImageSource.camera);
    if (img == null) {
      return;
    }
    //ในกรณีเลือกรูปแล้ว ให้กำหนดค่าตัวแปร เอาไว้ใช้งาน ทั้งนี้โค้ดมีผลต่อการแสดงผลหน้าจอ ต้องเขียนอยู่ภายใต้คำสั่ง setState
    setState(() {
      selectImage = File(img.path);
  });
  }
  //ในกรณีเลือกรูปแล้ว ให้กำหนดค่าตัวแปร เอาไว้ใช้งาน ทั้งนี้โค้ดมีผลต่อการแสดงผลหน้าจอ ต้องเขียนอยู่ภายใต้คำสั่ง setState
  

  //Wethod เปิดแกเลอรี่
  Future selectImageFormGallery() async{
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);

    //ตรวจสอบว่าได้เลือกรูป
    if (img == null) {
      return;
    }

     setState(() {
      selectImage = File(img.path);
  });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          "Splash Cam",
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,

      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(
                height: 60.0,
              ),
              CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 100.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child:selectImage == null? 
                  Image.asset(
                    'assets/images/logo.png',
                    width: 180.0,
                  )
                  :
                  Image.file(
                          File(selectImage!.path),
                          fit: BoxFit.cover,
                          width: 205,
                          height: 205,
                ),
              ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red[300],
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                        left: 20,
                        right: 20,
                      ),
                    ),
                    onPressed: () {
                      selectImageFormCamera();
                    },
                    icon: Icon(FontAwesomeIcons.camera),
                    label: Text(
                      "Camera",
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green[300],
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                        left: 20,
                        right: 20,
                      ),
                    ),
                    onPressed: () {
                      selectImageFormGallery();
                    },
                    icon: Icon(FontAwesomeIcons.images),
                    label: Text(
                      "Gallery",
                    ),
                  ),
                ],
              ),
            ]
      ),
      ),
      ),
    );
  }
}