// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonWidget {
  Widget textWidget(
      {text,
      textAlign,
      textColor,
      textSize,
      textWeight,
      textmaxLine,
      textoverFlow}) {
    return Text(
      text,
      maxLines: textmaxLine,
      textAlign: textAlign,
      overflow: textoverFlow,
      style: GoogleFonts.poppins(
          color: textColor, fontSize: textSize, fontWeight: textWeight),
    );
  }

  Future<bool?> toast({toastMsg, toastColor}) {
    return Fluttertoast.showToast(
        msg: toastMsg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: toastColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
