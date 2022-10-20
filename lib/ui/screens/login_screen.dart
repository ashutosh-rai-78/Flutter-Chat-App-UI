import 'package:flutter/material.dart';
import 'package:flutter_chat_app_ui/di/get_it.dart';
import 'package:flutter_chat_app_ui/firebase/auth.dart';
import 'package:flutter_chat_app_ui/ui/screens/chat_screen.dart';
import 'package:flutter_chat_app_ui/ui/screens/contact_list_screen.dart';
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
            const Text(
              "Email",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            AuthTextField(hint: "Enter your email", controller: emailController,),
            const SizedBox(height: 20),
            // -------------------- PASSWORD -----------------------------------------
            const Text(
              "Password",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            AuthTextField(hint: "Enter your password", controller: passwordController,isPassword: true,),
            const SizedBox(height: 20),
            // -------------------- FORGET PASSWORD ----------------------------------
            const Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D63D5)),
                )),
            const SizedBox(height: 20),
            // -------------------- LOGIN BUTTON ---------------------------------------
            ElevatedButton(
                // ignore: prefer_const_constructors
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff4D63D5),
                  elevation: 3,
                  minimumSize: const Size(double.infinity, 50),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
                onPressed: () async {
                  final code = await auth.login(emailController.text, passwordController.text);
                  if(!mounted) return;
                  if(code == "success"){
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChatScreen()),
                  );
                  } else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(code)));
                  }

                },
                child: const Text(
                  "Log in",
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: const TextSpan(
                  text: "Don't have an account?",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  /*defining default style is optional */
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Sign up',
                        style: TextStyle(
                            color: Color(0xff4D63D5),
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
