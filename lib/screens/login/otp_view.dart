import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gofetch/constants/app_constants.dart';
import 'package:gofetch/screens/login/new_password_view.dart';
import 'package:gofetch/screens/login/rest_password_view.dart';
import 'package:gofetch/screens/login/sing_up_view.dart';
import 'package:gofetch/shared_wedget/button.dart';
import 'package:gofetch/shared_wedget/roundtext.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  @override
  Widget build(BuildContext context) {
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
                "We have send an OTP to \n your mobile number",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: app_colors.primaryText,
                    height: 1.2,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Please check your mobile number 770****42 \n to continue to reset your password",
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.5,
                  color: app_colors.secondaryText,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OtoInputField(),
                  OtoInputField(),
                  OtoInputField(),
                  OtoInputField(),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Button(
                title: "Next",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewPasswordView()));
                },
              ),
              SizedBox(
                height: 4,
              ),
              TextButton(
                onPressed: () {
                  ////
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't Receive? ",
                      style: TextStyle(
                        color: app_colors.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Click here",
                      style: TextStyle(
                        color: app_colors.main,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtoInputField extends StatelessWidget {
  const OtoInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: app_colors.placeholder,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Form(
          child: SizedBox(
        height: 65,
        width: 64,
        child: Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: TextFormField(
            textAlign: TextAlign.center,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "*",
                hintStyle: TextStyle(
                  fontSize: 30,
                )),
            // the number that the user input it will has a large size not small
            style: Theme.of(context).textTheme.headlineLarge,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
      )),
    );
  }
}
