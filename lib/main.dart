
import 'package:flutter/material.dart';
import 'package:gofetch/screens/home/menu_view.dart';
import 'package:gofetch/screens/login/login_view.dart';
import 'package:gofetch/screens/login/sing_up_view.dart';
import 'package:gofetch/screens/login/welcome_view.dart';
import 'package:gofetch/screens/more/more_view.dart';
import 'package:gofetch/screens/onboarding/startup_view.dart';

void main() {
  runApp((GoFetch()));
}

class GoFetch extends StatelessWidget {
  const GoFetch({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "GoFetch",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Metropolis"
      ),
      home: const StartupView(),
    );
  }
}