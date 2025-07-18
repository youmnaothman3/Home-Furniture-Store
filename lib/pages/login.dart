import 'package:flutter/material.dart';
import 'package:furniturestore/core/resources/assets_manager.dart';
import 'package:furniturestore/core/resources/colors_manger.dart';
import 'package:furniturestore/core/resources/string_manger.dart';
import 'package:furniturestore/pages/homepage.dart';
import 'package:furniturestore/pages/sinup.dart';
import 'package:furniturestore/widgets/auth_form_container.dart';
import 'package:furniturestore/widgets/custom_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
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
              StringManager.HelloWELCOME,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: ColorsManager.primarycolor,
              ),
            ),
          ),
          SizedBox(height: 10),
          // Container(
          //   width: 327,
          //   height: 396,
          //   decoration: BoxDecoration(
          //     color: ColorsManager.conte,
          //     boxShadow: [
          //       BoxShadow(
          //         color: ColorsManager.shadow.withOpacity(0.1),
          //         blurRadius: 40,
          //         offset: const Offset(0, 4),
          //       ),
          //     ],
          //   ),
          //   child: Column(
          //     children: [
          //       Form(
          //         key: formKey,
          //         child: Padding(
          //           padding: const EdgeInsets.all(45.0),
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               TextFormField(
          //                 validator: (String? emailValue) {
          //                   final bool emailValid = RegExp(
          //                     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
          //                   ).hasMatch(emailValue!);
          //                   if (!emailValid) {
          //                     return 'invalid Email, please enter your correct infromation';
          //                   }

          //                   return null;
          //                 },
          //                 controller: email,
          //                 decoration: InputDecoration(
          //                   border: OutlineInputBorder(),
          //                   errorBorder: UnderlineInputBorder(
          //                     borderSide: BorderSide(color: Colors.red),
          //                   ),
          //                   labelText: 'Email',
          //                 ),
          //               ),
          //               SizedBox(height: 20),
          //               TextFormField(
          //                 validator: (String? passwordValue) {
          //                   if (passwordValue!.length < 6) {
          //                     return 'please enter more than 6 chracters';
          //                   }
          //                   return null;
          //                 },
          //                 controller: password,
          //                 decoration: InputDecoration(
          //                   border: OutlineInputBorder(),
          //                   labelText: 'Password',
          //                 ),
          //               ),
          //               SizedBox(height: 10),
          //               TextButton(
          //                 onPressed: () {},
          //                 child: Text(
          //                   'Forgot Password',
          //                   style: TextStyle(color: Colors.black),
          //                 ),
          //               ),
          //               SizedBox(height: 10),
          //               CustomButton(
          //                 title: 'Log in',
          //                 backgroundColor: ColorsManager.primarycolor,
          //                 onPressed: () {
          //                   if (formKey.currentState!.validate()) {
          //                     Navigator.pushReplacement(
          //                       context,
          //                       MaterialPageRoute(
          //                         builder: (context) => Signup(),
          //                       ),
          //                     );
          //                   } else {
          //                     ScaffoldMessenger.of(context).showSnackBar(
          //                       SnackBar(
          //                         content: Text('Invalid Infromation'),
          //                         backgroundColor: Colors.red,
          //                       ),
          //                     );
          //                   }
          //                 },
          //               ),

          //               SizedBox(height: 10),

          //               TextButton(
          //                 onPressed: () {
          //                   Navigator.pushNamed(context, '/signup');
          //                 },
          //                 child: Text(
          //                   'Sign up',
          //                   style: TextStyle(color: Colors.black),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          AuthFormContainer(
            formKey: formKey,
            emailController: email,
            passwordController: password,
            buttonText: 'Log in',
            onForgotPassword: () {
              // تنفيذ عند نسيان كلمة المرور
            },
            onSubmit: () {
              if (formKey.currentState!.validate()) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Invalid Information'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            onSignUpPressed: () {
              Navigator.pushNamed(context, '/signup');
            },
          ),
        ],
      ),
    );
  }
}
