import 'package:flutter/material.dart';
import 'package:gofetch/constants/app_constants.dart';
import 'package:gofetch/main_tabview/main_tab_view.dart';
import 'package:gofetch/screens/home/home_view..dart';
import 'package:gofetch/screens/login/rest_password_view.dart';
import 'package:gofetch/screens/login/sing_up_view.dart';
import 'package:gofetch/shared_wedget/button.dart';
import 'package:gofetch/shared_wedget/roundtext.dart';

import 'package:flutter/material.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  final TextEditingController textPassword = TextEditingController();
  final TextEditingController textConfirmPassword = TextEditingController();
  String errorPassword = "";
  bool _obscureTextPassword = true; // للتحكم في إظهار أو إخفاء كلمة المرور
  bool _obscureTextConfirmPassword = true; // للتحكم في إظهار أو إخفاء تأكيد كلمة المرور

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 64),
              Text(
                "New Password",
                style: TextStyle(
                  color: app_colors.primaryText,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Please enter your new password",
                style: TextStyle(
                  color: app_colors.secondaryText,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 30),
              _buildPasswordField(
                hintText: "New Password",
                controller: textPassword,
                obscureText: _obscureTextPassword,
                onToggle: () {
                  setState(() {
                    _obscureTextPassword = !_obscureTextPassword;
                  });
                },
              ),
              SizedBox(height: 20),
              _buildPasswordField(
                hintText: "Confirm Password",
                controller: textConfirmPassword,
                obscureText: _obscureTextConfirmPassword,
                onToggle: () {
                  setState(() {
                    _obscureTextConfirmPassword = !_obscureTextConfirmPassword;
                  });
                },
              ),
              SizedBox(height: 25),
              if (errorPassword.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    errorPassword,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              Button(
                title: "Next",
                onPressed: () {
                  if (validateInputs()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainTabView()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // دالة لإنشاء حقل كلمة المرور مع أيقونة العين
  Widget _buildPasswordField({
    required String hintText,
    required TextEditingController controller,
    required bool obscureText,
    required VoidCallback onToggle,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: app_colors.placeholder,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: onToggle,
        ),
      ),
    );
  }

  // دالة للتحقق من صحة المدخلات
  bool validateInputs() {
    setState(() {
      errorPassword = ""; // إعادة تعيين رسالة الخطأ
    });

    String password = textPassword.text.trim();
    String confirmPassword = textConfirmPassword.text.trim();

    if (password.isEmpty) {
      errorPassword = "Please enter your password";
      return false;
    }

    if (confirmPassword.isEmpty) {
      errorPassword = "Please confirm your password";
      return false;
    }

    if (password != confirmPassword) {
      errorPassword = "Passwords do not match";
      return false;
    }

    if (password.length < 8) {
      errorPassword = "Password must be at least 8 characters long";
      return false;
    }

    return true; // البيانات صحيحة
  }
}