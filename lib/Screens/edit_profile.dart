// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, deprecated_member_use

import 'dart:io';

import 'package:demo_project/Helper/common_widget.dart';
import 'package:demo_project/Helper/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController fullnameController =
      TextEditingController(text: "Naimish Varsani");
  TextEditingController emailController =
      TextEditingController(text: "naimish123@gmail.com");
  TextEditingController phoneNumberController =
      TextEditingController(text: "9876543210");

  File? _image;
  final picker = ImagePicker();

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print(_image);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkAppColor.bgColor,
      appBar: AppBar(
        backgroundColor: DarkAppColor.bgColor,
        surfaceTintColor: DarkAppColor.bgColor,
        iconTheme: IconThemeData(color: DarkAppColor.primaryColor),
        title: CommonWidget().textWidget(
          text: "Edit Profile",
          textColor: DarkAppColor.primaryColor,
          textSize: 22.0,
          textWeight: FontWeight.w500,
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/bg.jpg"),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              _image != null
                  ? CircleAvatar(
                      backgroundImage: FileImage(_image!),
                      radius: 50,
                    )
                  : CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          "https://www.shutterstock.com/image-vector/man-character-face-avatar-glasses-600nw-542759665.jpg"),
                    ),
              TextButton(
                  onPressed: _pickImageFromGallery,
                  child: Text(
                    "Change Image",
                    style: TextStyle(
                      color: DarkAppColor.primaryColor.withOpacity(.5),
                    ),
                  )),
              SizedBox(height: 10),
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: DarkAppColor.softgreyColor,
                    ),
                    borderRadius: BorderRadius.circular(25)),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  style: TextStyle(color: DarkAppColor.primaryColor),
                  controller: fullnameController,
                  // initialValue: "Naimish Varsani",
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Full Name",
                      hintStyle: TextStyle(
                        color: DarkAppColor.primaryColor.withOpacity(.5),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15)),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: DarkAppColor.softgreyColor,
                    ),
                    borderRadius: BorderRadius.circular(25)),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: DarkAppColor.primaryColor),
                  controller: emailController,
                  // initialValue: "naimish123@gmail.com",
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: DarkAppColor.primaryColor.withOpacity(.5),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15)),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: DarkAppColor.softgreyColor,
                    ),
                    borderRadius: BorderRadius.circular(25)),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: DarkAppColor.primaryColor),
                  // initialValue: "9876543210",
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Phone Number",
                      hintStyle: TextStyle(
                        color: DarkAppColor.primaryColor.withOpacity(.5),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15)),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: BorderSide(color: DarkAppColor.primaryColor)),
                  onPressed: () {
                    Get.back();
                  },
                  child: CommonWidget().textWidget(
                    text: "Save",
                    textColor: DarkAppColor.primaryColor,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
