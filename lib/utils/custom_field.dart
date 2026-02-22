// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:websockets/constants/constants.dart';

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  const CustomField({
    Key? key,
    required this.controller,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 3,
              color: Colors.blue,
              blurRadius: 10
            )
          ]
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.black,
            filled: true,
            hintText: text
          ),
          controller: controller,
        ),
      ),
    );
  }
}
