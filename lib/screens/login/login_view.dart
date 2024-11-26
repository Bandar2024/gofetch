import 'package:flutter/material.dart';
import 'package:gofetch/constants/app_constants.dart';
import 'package:gofetch/screens/login/sing_up_view.dart';
import 'package:gofetch/screens/home/home_view..dart'; // تأكد من استيراد HomeView هنا
import 'package:gofetch/shared_wedget/button.dart';
import 'package:gofetch/shared_wedget/roundtext.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController textEmail = TextEditingController();
  TextEditingController textPassword = TextEditingController();
  
  String errorLogin = "";
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 64),
                Text(
                  "Login",
                  style: TextStyle(
                    color: app_colors.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Add your details to login",
                  style: TextStyle(
                    color: app_colors.secondaryText,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 25),
                roundtext(
                  bgColor: app_colors.placeholder,
                  hintText: "Your Email",
                  controller: textEmail,
                  keyboardType: TextInputType.emailAddress,
                  validator: emailValidator,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: textPassword,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    hintText: "Password",
                    fillColor: app_colors.placeholder,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16),
                if (errorLogin.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      errorLogin,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                Button(
                  title: "Login",
                  fontSize: 18,
                  onPressed: () {
                    if (validateInputs()) {
                      // الانتقال إلى الصفحة الرئيسية بعد التحقق من صحة البيانات
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeView(userEmail: textEmail.text.trim()),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 32),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SingUpView()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Don't have an Account? ",
                        style: TextStyle(
                          color: app_colors.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: app_colors.main,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // دالة للتحقق من صحة المدخلات
  bool validateInputs() {
    setState(() {
      errorLogin = "";
    });

    String email = textEmail.text.trim();
    String password = textPassword.text.trim();

    if (email.isEmpty) {
      errorLogin = "Please enter your email";
      return false;
    }

    if (password.isEmpty) {
      errorLogin = "Please enter your password";
      return false;
    }

    String? emailError = emailValidator(email);
    if (emailError != null) {
      errorLogin = emailError;
      return false;
    }

    String? passwordError = passwordValidator(password);
    if (passwordError != null) {
      errorLogin = passwordError;
      return false;
    }

    return true; // البيانات صحيحة
  }

  String? emailValidator(String email) {
    final RegExp emailPattern =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,}$');

    if (!emailPattern.hasMatch(email)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? passwordValidator(String password) {
    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }
}