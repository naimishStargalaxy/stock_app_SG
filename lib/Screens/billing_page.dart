// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:demo_project/Helper/common_widget.dart';
import 'package:demo_project/Helper/utility.dart';
import 'package:flutter/material.dart';

class BillingPage extends StatelessWidget {
  const BillingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DarkAppColor.bgColor,
        appBar: AppBar(
          backgroundColor: DarkAppColor.bgColor,
          iconTheme: IconThemeData(color: DarkAppColor.primaryColor),
          surfaceTintColor: Colors.transparent,
          title: CommonWidget().textWidget(
            text: "Billing & Payment",
            textColor: DarkAppColor.primaryColor,
            textSize: 22.0,
            textWeight: FontWeight.w500,
          ),
        ),
        body: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 15),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                CommonWidget().toast(
                  toastMsg: "This feature add soon",
                  toastColor: Colors.blue,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: DarkAppColor.softgreyColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Image.asset(paymentData[index].image),
                      ),
                    ),
                    SizedBox(height: 10),
                    CommonWidget().textWidget(
                        text: paymentData[index].fullname,
                        textSize: 18.0,
                        textWeight: FontWeight.w600,
                        textColor: DarkAppColor.primaryColor)
                  ],
                ),
              ),
            );
          },
          itemCount: paymentData.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15),
        ));
  }
}

class PaymentData {
  String image;
  String fullname;

  PaymentData({
    required this.image,
    required this.fullname,
  });
}

List<PaymentData> paymentData = [
  PaymentData(
    image: "assets/card.png",
    fullname: "Master Card",
  ),
  PaymentData(
    image: "assets/symbols.png",
    fullname: "Visa Card",
  ),
  PaymentData(
    image: "assets/money.png",
    fullname: "Cash",
  ),
  PaymentData(
    image: "assets/mobile-banking.png",
    fullname: "Net-Banking",
  ),
  PaymentData(
    image: "assets/google-pay.png",
    fullname: "GooglePay",
  ),
];
