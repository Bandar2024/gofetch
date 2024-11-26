import 'package:flutter/material.dart';
import 'package:gofetch/constants/app_constants.dart';
import 'package:gofetch/shared_wedget/button.dart';
import 'package:gofetch/shared_wedget/roundtext.dart';
import 'login_view.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // استيراد مكتبة Dart I/O

class SingUpView extends StatefulWidget {
  const SingUpView({super.key});

  @override
  State<SingUpView> createState() => _SingUpViewState();
}

class _SingUpViewState extends State<SingUpView> {
  TextEditingController textFullName = TextEditingController();
  TextEditingController textEmail = TextEditingController();
  TextEditingController textMobileNumber = TextEditingController();
  TextEditingController textAddress = TextEditingController();
  TextEditingController textPassword = TextEditingController();
  TextEditingController textConfirmPassword = TextEditingController();
  
  final _formKey = GlobalKey<FormState>();
  XFile? _imageFile; // لتخزين الصورة المختارة

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image; // تعيين الصورة المختارة
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 64),
                Text(
                  "Sign Up",
                  style: TextStyle(
                      color: app_colors.primaryText,
                      fontSize: 30,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10),
                Text(
                  "Add your details to sign up",
                  style: TextStyle(
                    color: app_colors.secondaryText,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 45),

                // زر لاختيار الصورة
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _imageFile != null 
                        ? FileImage(File(_imageFile!.path)) 
                        : AssetImage("assets/img/user_placeholder.png") as ImageProvider, // صورة افتراضية
                  ),
                ),
                const SizedBox(height: 20),

                roundtext(
                  bgColor: app_colors.placeholder,
                  left: Icon(Icons.person, color: app_colors.textFiled),
                  hintText: "Full Name",
                  controller: textFullName,
                  validator: nameValidator,
                ),
                const SizedBox(height: 20),
                roundtext(
                  bgColor: app_colors.placeholder,
                  left: Icon(Icons.email, color: app_colors.textFiled),
                  hintText: "Email",
                  controller: textEmail,
                  keyboardType: TextInputType.emailAddress,
                  validator: emailValidator,
                ),
                const SizedBox(height: 20),
                roundtext(
                  bgColor: app_colors.placeholder,
                  left: Icon(Icons.phone, color: app_colors.textFiled),
                  hintText: "Mobile No",
                  controller: textMobileNumber,
                  keyboardType: TextInputType.number,
                  validator: mobileNumberValidator,
                ),
                const SizedBox(height: 20),
                roundtext(
                  bgColor: app_colors.placeholder,
                  left: Icon(Icons.location_city, color: app_colors.textFiled),
                  hintText: "Address",
                  controller: textAddress,
                  validator: addressValidator,
                ),
                const SizedBox(height: 20),
                roundtext(
                  left: Icon(Icons.lock, color: app_colors.textFiled),
                  bgColor: app_colors.placeholder,
                  hintText: "Password",
                  controller: textPassword,
                  obscureText: true,
                  validator: passwordValidator,
                ),
                const SizedBox(height: 20),
                roundtext(
                  bgColor: app_colors.placeholder,
                  left: Icon(Icons.lock, color: app_colors.textFiled),
                  hintText: "Confirm Password",
                  controller: textConfirmPassword,
                  obscureText: true,
                  validator: confirmPasswordValidator,
                ),
                const SizedBox(height: 25),
                Button(
                  title: "Sign Up",
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _imageFile != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginView()));
                    } else if (_imageFile == null) {
                      // رسالة تنبيه إذا لم يتم اختيار صورة
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please select a profile picture')),
                      );
                    }
                  },
                ),
                const SizedBox(height: 4),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginView()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an Account? ",
                        style: TextStyle(
                          color: app_colors.secondaryText,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                          color: app_colors.main,
                          fontSize: 15,
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
      ),
    );
  }

  // Validators

  String? nameValidator(String name) {
    if (name.isEmpty) {
      return 'Name cannot be empty';
    }
    return null;
  }

  String? emailValidator(String email) {
    final RegExp emailPattern =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,}$');

    if (!emailPattern.hasMatch(email)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? mobileNumberValidator(String mobileNumber) {
    final RegExp phonePattern = RegExp(r'^[0-9+]{6,15}$'); // Adjust pattern based on region
    if (!phonePattern.hasMatch(mobileNumber)) {
      return 'Invalid mobile number format';
    }
    return null;
  }

  String? addressValidator(String address) {
    if (address.isEmpty) {
      return 'Address cannot be empty';
    }
    return null;
  }

  String? passwordValidator(String password) {
    if (password.isEmpty) {
      return 'Password cannot be empty';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  String? confirmPasswordValidator(String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Confirm password cannot be empty';
    }
    if (confirmPassword != textPassword.text) {
      return 'Passwords do not match';
    }
    return null;
  }
}