import 'package:flutter/material.dart';
import 'package:flutter_chat_app_ui/di/get_it.dart';
import 'package:flutter_chat_app_ui/firebase/auth.dart';
import 'package:flutter_chat_app_ui/ui/screens/chat_screen.dart';
import 'package:flutter_chat_app_ui/ui/screens/contact_list_screen.dart';
import 'package:flutter_chat_app_ui/ui/screens/signup_screen.dart';
import 'package:flutter_chat_app_ui/ui/widgets/auth_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double? h;

// 4D63D5
// 514ACF
// 572DC9
  Color primary = Color(0x4D63D5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, s) {
        h ??= s.maxHeight;
        // print(h! - s.maxHeight);
        // print(s);

        return Stack(children: [
          Positioned(
            right: 0,
            left: 0,
            top: (s.maxHeight - h!) / 2,
            child: Image.asset(
              "assets/images/bg.png",
            ),
          ),
          /* 
              return SizedBox(
                width: s.maxHeight,
                height: s.maxHeight / 3,
                child: Image.asset(
                  "assets/images/bg.png",
                  // fit: BoxFit.cover,
                  // centerSlice: Rect.largest,
                ),
              );
               */
          const _LoginFrom(),
        ]);
      }),
    );
  }
}

class _LoginFrom extends StatefulWidget {
  const _LoginFrom({super.key});

  @override
  State<_LoginFrom> createState() => __LoginFromState();
}

class __LoginFromState extends State<_LoginFrom> {
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
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 200),
            const Text(
              "Welcome Back!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // -------------------- EMAIL -------------------------------------------
            Text(
              "Email",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 5),
            AuthTextField(
              hint: "Enter your email",
              controller: emailController, type: AuthTextFieldType.email,
                validator: (value) {
                // Email Validation
                  final regExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
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
                hint: "Enter your password",
                controller: passwordController,
                type: AuthTextFieldType.password,
                validator: (value) {
                  if (value == null || value.length < 4) {
                    return 'Password is short';
                  }
                  return null;
                }),
            const SizedBox(height: 20),
            // -------------------- FORGET PASSWORD ----------------------------------
            Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Forgot Password?",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: Theme.of(context).colorScheme.primary
                  ),
                )),
            const SizedBox(height: 20),
            // -------------------- LOGIN BUTTON ---------------------------------------
            ElevatedButton(
                // ignore: prefer_const_constructors
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  elevation: 3,
                  minimumSize: const Size(double.infinity, 50),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
                onPressed: () async {
                  final code = await auth.login(
                      emailController.text, passwordController.text);
                  if (!mounted) return;
                  if (code == "success") {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChatScreen()),
                    );
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(code)));
                  }
                },
                child: Text(
                  "Log in",
                  style:Theme.of(context).textTheme.bodyText2,
                )),
            const SizedBox(height: 20),
            InkWell(
               onTap: (){
                 Navigator.pushReplacement(
                   context,
                   MaterialPageRoute(
                       builder: (context) => const SignUpScreen()),
                 );
               },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: Theme.of(context).textTheme.bodyText2,),
                  SizedBox(width: 5,),
                  Text("Sign Up",style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Theme.of(context).colorScheme.primary
                  )),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
