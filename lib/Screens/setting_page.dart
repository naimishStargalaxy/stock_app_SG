// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, deprecated_member_use

import 'package:demo_project/Controllers/auth_controller.dart';
import 'package:demo_project/Controllers/profile_controller.dart';
import 'package:demo_project/Helper/common_widget.dart';
import 'package:demo_project/Screens/billing_page.dart';
import 'package:demo_project/Screens/faq_page.dart';
import 'package:demo_project/Screens/privacy_policy_page.dart';
import 'package:demo_project/Screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helper/utility.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  AuthController _controller = Get.put(AuthController());
  ProfileController _profileController = Get.put(ProfileController());

  final InAppReview inAppReview = InAppReview.instance;
  showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text(
        "No",
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        "Yes",
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onPressed: () async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.clear();
        Get.offAll(() => SigninPage());
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        "Logout",
        style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700),
      ),
      content: Text(
        "Are you sure for Logout?",
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  deleteShowAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text(
        "No",
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        "Yes",
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onPressed: () async {
        _controller.userDelete(userId: _profileController.userId.value);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        "Delete Account",
        style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700),
      ),
      content: Text(
        "Are you sure for Delete Account?",
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkAppColor.bgColor,
      appBar: AppBar(
        backgroundColor: DarkAppColor.bgColor,
        iconTheme: IconThemeData(color: DarkAppColor.primaryColor),
        surfaceTintColor: Colors.transparent,
        title: CommonWidget().textWidget(
          text: "Setting",
          textColor: DarkAppColor.primaryColor,
          textSize: 22.0,
          textWeight: FontWeight.w500,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          ListTile(
            onTap: () {
              Get.to(() => BillingPage());
            },
            leading: Icon(
              Icons.payment,
              color: DarkAppColor.primaryColor,
              size: 30,
            ),
            title: CommonWidget().textWidget(
              text: "Billing/Payment",
              textColor: DarkAppColor.primaryColor,
              textSize: 18.0,
              textWeight: FontWeight.w500,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),

          Divider(
            indent: 15,
            endIndent: 15,
          ),
          ListTile(
            onTap: () {
              inAppReview.openStoreListing(
                  microsoftStoreId: 'com.example.demo_project');
            },
            leading: Icon(
              Icons.share,
              color: DarkAppColor.primaryColor,
              size: 30,
            ),
            title: CommonWidget().textWidget(
              text: "Share App",
              textColor: DarkAppColor.primaryColor,
              textSize: 18.0,
              textWeight: FontWeight.w500,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
          Divider(
            indent: 15,
            endIndent: 15,
          ),
          ListTile(
            onTap: () {
              Get.to(() => FaqPage());
            },
            leading: Icon(
              Icons.question_mark,
              color: DarkAppColor.primaryColor,
              size: 30,
            ),
            title: CommonWidget().textWidget(
              text: "FAQ",
              textColor: DarkAppColor.primaryColor,
              textSize: 18.0,
              textWeight: FontWeight.w500,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
          Divider(
            indent: 15,
            endIndent: 15,
          ),
          // Obx(
          //   () => ListTile(
          //     leading: Icon(
          //       _controller.currentTheme.value == ThemeMode.dark
          //           ? Icons.dark_mode
          //           : Icons.light_mode,
          //       color: DarkAppColor.primaryColor,
          //       size: 30,
          //     ),
          //     title: CommonWidget().textWidget(
          //       text: _controller.currentTheme.value == ThemeMode.dark
          //           ? "Dark Theme"
          //           : "Light Theme",
          //       textColor: DarkAppColor.primaryColor,
          //       textSize: 18.0,
          //       textWeight: FontWeight.w500,
          //     ),
          //     trailing: Obx(() => Switch(
          //           value: _controller.currentTheme.value == ThemeMode.dark,
          //           onChanged: (value) {
          //             _controller.switchTheme();
          //             Get.changeThemeMode(_controller.currentTheme.value);
          //           },
          //           activeColor: CustomTheme.activeColor,
          //         )),
          //   ),
          // ),
          // Divider(
          //   indent: 15,
          //   endIndent: 15,
          // ),
          ListTile(
            leading: Icon(
              Icons.policy_outlined,
              color: DarkAppColor.primaryColor,
              size: 30,
            ),
            onTap: () {
              Get.to(() => PrivacyPolicyPage());
            },
            title: CommonWidget().textWidget(
              text: "Privacy Policy",
              textColor: DarkAppColor.primaryColor,
              textSize: 18.0,
              textWeight: FontWeight.w500,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
          Divider(
            indent: 15,
            endIndent: 15,
          ),
          ListTile(
            leading: Icon(
              Icons.feed_outlined,
              color: DarkAppColor.primaryColor,
              size: 30,
            ),
            onTap: () {
              CommonWidget().toast(
                toastMsg: "This feature add soon",
                toastColor: Colors.blue,
              );
            },
            title: CommonWidget().textWidget(
              text: "Terms Condition",
              textColor: DarkAppColor.primaryColor,
              textSize: 18.0,
              textWeight: FontWeight.w500,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
          Divider(
            indent: 15,
            endIndent: 15,
          ),
          ListTile(
            leading: Icon(
              Icons.no_accounts,
              color: DarkAppColor.primaryColor,
              size: 30,
            ),
            onTap: () {
              deleteShowAlertDialog(context);
            },
            title: CommonWidget().textWidget(
              text: "Delete Account",
              textColor: DarkAppColor.redColor,
              textSize: 18.0,
              textWeight: FontWeight.w500,
            ),
          ),
          Divider(
            indent: 15,
            endIndent: 15,
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: DarkAppColor.primaryColor,
              size: 30,
            ),
            onTap: () {
              showAlertDialog(context);
            },
            title: CommonWidget().textWidget(
              text: "Log Out",
              textColor: DarkAppColor.redColor,
              textSize: 18.0,
              textWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20),
          CommonWidget().textWidget(
            text: "App Version : 1.0.0",
            textColor: DarkAppColor.primaryColor.withOpacity(.3),
            textSize: 12.0,
            textWeight: FontWeight.w500,
          ),
          SizedBox(height: 5),
          CommonWidget().textWidget(
            text: "Created BY : Naimish",
            textColor: DarkAppColor.primaryColor.withOpacity(.3),
            textSize: 12.0,
            textWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
