import 'package:flutter/material.dart';

enum AuthTextFieldType{
  password,
  email,
  text
}

class AuthTextField extends StatefulWidget {
  final String hint;
  final TextEditingController? controller;
  final AuthTextFieldType type;
  final String? Function(String?)? validator;

  const AuthTextField({Key? key, required this.hint, this.controller, this.type = AuthTextFieldType.text,  this.validator}) : super(key: key);

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
   bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      keyboardType: _getKeyboardType(),
      obscureText: !isVisible && widget.type == AuthTextFieldType.password,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: widget.type == AuthTextFieldType.password? IconButton(
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

  TextInputType _getKeyboardType(){
    switch(widget.type){

      case AuthTextFieldType.password:
        return TextInputType.text;
      case AuthTextFieldType.email:
       return TextInputType.emailAddress;
      case AuthTextFieldType.text:
        return TextInputType.text;

    }
  }


}
