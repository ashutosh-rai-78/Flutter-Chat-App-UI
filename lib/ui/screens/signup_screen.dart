import 'package:flutter/material.dart';
import 'package:flutter_chat_app_ui/di/get_it.dart';
import 'package:flutter_chat_app_ui/firebase/auth.dart';
import 'package:flutter_chat_app_ui/ui/widgets/auth_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late Auth auth;
  late TextEditingController emailController;
  late TextEditingController passwordController;


  @override
  void initState() {
    auth = locator();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          AuthTextField(hint: "Email", type: AuthTextFieldType.email, controller: emailController),
          AuthTextField(hint: "Password", type: AuthTextFieldType.password, controller: passwordController),
          ElevatedButton( child: const Text("Create Account"),onPressed: (){
            auth.signUp(emailController.text, passwordController.text);
          },)
        ],
      ),
    );
  }
}
