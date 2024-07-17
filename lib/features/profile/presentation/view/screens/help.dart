import '../../../../../core/recourses/color%20manager/color%20manager.dart';
import '../../../../../core/recourses/fount%20manager/font%20manager.dart';
import '../../../../../core/recourses/styles%20manger/styles%20manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: context.theme.splashColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: ColorManager.white,
        ),
        title: Text(
          'Help & Support',
          style: getBoldStyle(
              color: ColorManager.white, fontSize: FontSizeManager.s22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Text(
              "Welcome to the Help & Support Page. Here you will find information and answers to frequently asked questions.",
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            Text(
              "Frequently Asked Questions:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("How do I create an account?"),
              subtitle: Text(
                "To create an account, click on the 'Sign Up' button on the login screen and fill in the required details.",
              ),
            ),
            Divider(),
            ListTile(
              title: Text("How do I reset my password?"),
              subtitle: Text(
                "To reset your password, click on the 'Forgot Password' link on the login screen and follow the instructions.",
              ),
            ),
            Divider(),
            ListTile(
              title: Text("How do I contact support?"),
              subtitle: Text(
                "You can contact support by emailing us at support@example.com or calling our support line at +123456789.",
              ),
            ),
            Divider(),
            ListTile(
              title: Text("How do I update my profile information?"),
              subtitle: Text(
                "To update your profile information, go to the 'Profile' section in the app and click on 'Edit Profile'.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
