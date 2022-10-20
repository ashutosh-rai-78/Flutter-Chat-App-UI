import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final String hint;
  final TextEditingController? controller;
  final bool isPassword;
  const AuthTextField({Key? key, required this.hint, this.controller, this.isPassword = false}) : super(key: key);

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
   bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
        if(value == null || value.length < 4){
          return 'length is to short';
        }
        return null;
      },
      keyboardType: widget.isPassword ? TextInputType.text : TextInputType.emailAddress,
      obscureText: !isVisible && widget.isPassword,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword == true? IconButton(
          icon: Icon(
            isVisible?Icons.visibility: Icons.visibility_off,
            color: Theme.of(context).colorScheme.primary,
          ), onPressed: () {
            setState(() {
              isVisible = !isVisible;
            });
        },
        ) : null,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0),
        /* border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff4D63D5), width: 1),
                borderRadius: BorderRadius.circular(50),
              ), */
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
          borderRadius: BorderRadius.circular(50),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color:Theme.of(context).colorScheme.primary, width: 2),
          borderRadius: BorderRadius.circular(50),
        ),
        hintText: widget.hint,
      ),
    );
  }
}
