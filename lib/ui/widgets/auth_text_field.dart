import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  const AuthTextField({Key? key, required this.hint, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: const Icon(
          Icons.hide_source,
          color: Color(0xff4D63D5),
        ),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0),
        /* border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff4D63D5), width: 1),
                borderRadius: BorderRadius.circular(50),
              ), */
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff4D63D5), width: 2),
          borderRadius: BorderRadius.circular(50),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff4D63D5), width: 2),
          borderRadius: BorderRadius.circular(50),
        ),
        hintText: hint,
      ),
    );
  }
}
