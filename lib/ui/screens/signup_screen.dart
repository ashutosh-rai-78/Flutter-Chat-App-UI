import 'package:flutter/material.dart';
import 'package:flutter_chat_app_ui/di/get_it.dart';
import 'package:flutter_chat_app_ui/firebase/auth.dart';
import 'package:flutter_chat_app_ui/ui/screens/chat_screen.dart';
import 'package:flutter_chat_app_ui/ui/screens/login_screen.dart';
import 'package:flutter_chat_app_ui/ui/screens/user_profile_setup_screen.dart';
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
  late TextEditingController conformController;
  bool isMatched = true;

  @override
  void initState() {
    auth = locator();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    conformController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp Screen"),
        centerTitle: true,
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              // ------------------------------------Email---------------------------------------------
              Text(
                "Email",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 5,
              ),
              AuthTextField(
                  hint: "Email",
                  controller: emailController,
                  type: AuthTextFieldType.email,
                  validator: (value) {
                    // Email Validation
                    final regExp = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                    if (value == null || !regExp.hasMatch(value)) {
                      return 'Email is not valid';
                    }
                    return null;
                  }),
              const SizedBox(height: 20),
              // -------------------- PASSWORD -----------------------------------------
              Text(
                "Password",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(height: 5),
              AuthTextField(
                  hint: "Password",
                  type: AuthTextFieldType.password,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.length < 4) {
                      return 'Password is short';
                    }
                    return null;
                  }),const SizedBox(height: 20),
              // -------------------- PASSWORD -----------------------------------------
              Text(
                "Conform Password",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(height: 5),
              AuthTextField(
                  hint: "Conform Password",
                  type: AuthTextFieldType.password,
                  controller: conformController,
                  validator: (value) {
                    if (passwordController.text != conformController.text) {
                      isMatched = false;
                      return 'Password not match';
                    }else{
                      isMatched = true;

                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              // -----------------------------------Confirm Password-----------------------------------
              /*Text(
                "Re-enter Password",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(height: 5),
              AuthTextField(hint: "Re-enter Password", type: AuthTextFieldType.password, controller: passwordController),
              const SizedBox(
                height: 20,
              ),*/
              // --------------------------------------SignUp Button---------------------------------------------
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 35, vertical: 12)),
                  ),
                  child: Text("Create Account", style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: Theme.of(context).colorScheme.primary
                  ),),
                  onPressed: () async {
                    if(isMatched){
                      final code = await auth.signUp(
                          emailController.text, passwordController.text);
                      if (!mounted) return;
                      if (code == "success") {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserProfileSetupScreen()),
                        );
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(code)));
                      }
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
