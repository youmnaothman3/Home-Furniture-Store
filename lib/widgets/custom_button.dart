import 'package:flutter/material.dart';
import 'package:furniturestore/core/resources/colors_manger.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final double borderRadius;
  final VoidCallback onPressed;
  

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.borderRadius = 4,
   
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(title,style: TextStyle(color: ColorsManager.conte),),
      ),
    );
  }
}
