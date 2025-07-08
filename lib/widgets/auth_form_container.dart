import 'package:flutter/material.dart';
import 'package:furniturestore/core/resources/colors_manger.dart';
import 'package:furniturestore/widgets/custom_button.dart';

class AuthFormContainer extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String buttonText;
  final VoidCallback onSubmit;
  final VoidCallback? onForgotPassword;
  final VoidCallback? onSignUpPressed;

  const AuthFormContainer({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.buttonText,
    required this.onSubmit,
    this.onForgotPassword,
    this.onSignUpPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 396,
      decoration: BoxDecoration(
        color: ColorsManager.conte,
        boxShadow: [
          BoxShadow(
            color: ColorsManager.shadow.withOpacity(0.1),
            blurRadius: 40,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(45.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                validator: (value) {
                  final emailRegex = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+",
                  );
                  if (!emailRegex.hasMatch(value ?? "")) {
                    return 'Invalid email, please check your input.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(

                    
                  ),
                  

                  
                  labelText: 'Password',
                ),
                validator: (value) {
                  if ((value ?? "").length < 6) {
                    return 'Password must be at least 6 characters.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              if (onForgotPassword != null)
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: onForgotPassword,
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              const SizedBox(height: 10),
              CustomButton(
                title: buttonText,
                backgroundColor: ColorsManager.primarycolor,
                onPressed: onSubmit,
              ),
              const SizedBox(height: 10),
              if (onSignUpPressed != null)
                TextButton(
                  onPressed: onSignUpPressed,
                  child: const Text(
                    'Sign up',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
