// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:demo_project/Helper/common_widget.dart';
import 'package:demo_project/Helper/utility.dart';
import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  int selectLanguage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DarkAppColor.bgColor,
        appBar: AppBar(
          backgroundColor: DarkAppColor.bgColor,
          iconTheme: IconThemeData(color: DarkAppColor.primaryColor),
          surfaceTintColor: Colors.transparent,
          title: CommonWidget().textWidget(
            text: "Select Language",
            textColor: DarkAppColor.primaryColor,
            textSize: 22.0,
            textWeight: FontWeight.w500,
          ),
        ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
                leading: CommonWidget().textWidget(
                  text: "Language ${index + 1}",
                  textColor: DarkAppColor.primaryColor,
                  textSize: 18.0,
                  textWeight: FontWeight.w500,
                ),
                onTap: () {
                  setState(() {});
                  selectLanguage = index;
                },
                minVerticalPadding: 0,
                trailing: selectLanguage == index
                    ? Icon(Icons.check_box, color: Colors.white)
                    : Icon(Icons.check_box_outlined));
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: 5,
          shrinkWrap: true,
        ));
  }
}
