// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:demo_project/Helper/common_widget.dart';
import 'package:demo_project/Helper/utility.dart';
import 'package:flutter/material.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkAppColor.bgColor,
      appBar: AppBar(
        backgroundColor: DarkAppColor.bgColor,
        iconTheme: IconThemeData(color: DarkAppColor.primaryColor),
        surfaceTintColor: Colors.transparent,
        title: CommonWidget().textWidget(
          text: "FAQ",
          textColor: DarkAppColor.primaryColor,
          textSize: 22.0,
          textWeight: FontWeight.w500,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: CommonWidget().textWidget(
              text:
                  "Where does it come from? Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",
              textColor: DarkAppColor.primaryColor,
              textWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
