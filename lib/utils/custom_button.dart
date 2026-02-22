import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CustomButton({super.key,required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity,50),
          shadowColor: Colors.white,elevation: 4,
          backgroundColor: Colors.blue,
          shape: LinearBorder()
        ),
        child: Text(text,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}