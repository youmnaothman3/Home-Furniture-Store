import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniturestore/core/resources/assets_manager.dart';
import 'package:furniturestore/core/resources/colors_manger.dart';
import 'package:furniturestore/core/resources/string_manger.dart';
import 'package:furniturestore/pages/homepage.dart';
import 'package:furniturestore/widgets/custom_button.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  bool confirmObscure = true;
   final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
           Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(AssetsManager.pattern, fit: BoxFit.cover),
          ),
          // Align(alignment: Alignment.bottomCenter,),
          SizedBox(height: 20),
          Center(
            child: Text(
              StringManager.WELCOME,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: ColorsManager.primarycolor,
              ),
            ),
          ),
          Form(
            key: formKey,
            child: Container(
               width: 327,
              height: 520,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 40,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                  controller: name, // افترضي أنك عرفتي TextEditingController name;
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                    if (value.trim().length < 3) {
                      return 'Name must be at least 3 characters';
                    }
                    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
                      return 'Name can only contain letters and spaces';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        IconAssets.iconarrow, // عدلي حسب اسم الأيقونة يلي عندك
                        width: 24,
                        height: 24,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
                
                    SizedBox(height: 10,),
                    TextFormField(
                      validator: (String? emailValue) {
                        final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                        ).hasMatch(emailValue!);
                        if (!emailValid) {
                          return 'invalid Email, please enter your correct infromation';
                        }
                
                        return null;
                      },
                      controller: email,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            IconAssets.iconarrow,
                            width: 24,
                            height: 24,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:ColorsManager.borderSidered),
                        ),
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: (String? passwordValue) {
                        if (passwordValue!.length < 6) {
                          return 'please enter more than 6 chracters';
                        }
                        return null;
                      },
                      controller: password,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            IconAssets.iconeye,
                            width: 24,
                            height: 24,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                  controller: confirmpassword,
                  obscureText: confirmObscure,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != password.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          confirmObscure = false; // لما تضغطي تظهر الكلمة
                        });
                      },
                      icon: SvgPicture.asset(
                       IconAssets.iconeye,// الأيقونة يلي عندها
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ),
                    SizedBox(height: 10),
                
                    CustomButton(
                      title: 'Sign up',
                      backgroundColor: ColorsManager.primarycolor,
                      onPressed: () {if (formKey.currentState!.validate()) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Invalid Infromation'),
                              backgroundColor: ColorsManager.borderSidered
                            ),
                          );
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Text('Already have account?'),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text(' Sign in')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}