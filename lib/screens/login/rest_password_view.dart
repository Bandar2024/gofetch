import 'package:flutter/material.dart';
import 'package:gofetch/constants/app_constants.dart';
import 'package:gofetch/screens/login/otp_view.dart';
import 'package:gofetch/screens/login/sing_up_view.dart';
import 'package:gofetch/shared_wedget/button.dart';
import 'package:gofetch/shared_wedget/roundtext.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textEmail = TextEditingController();

    void media = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 64,
              ),
              Text(
                "Reset Password",
                style: TextStyle(
                    color: app_colors.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Please enter your email receive a \n link to create a new password via email ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: app_colors.secondaryText,
                  height: 1.5,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              roundtext(
                bgColor: app_colors.placeholder,
                hintText: "Email",
                controller: textEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 25,
              ),
              Button(
                fontSize: 15,
                title: "Send",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OtpView()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
