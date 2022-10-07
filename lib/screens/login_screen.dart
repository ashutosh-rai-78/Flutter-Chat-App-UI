import 'package:flutter/material.dart';
import 'package:flutter_chat_app_ui/screens/chats_list_screen.dart';

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
  int? primary = 0x4D63D5;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
          const Text(
            "Email",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0),
              /* border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(50)), */
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff4D63D5), width: 2),
                borderRadius: BorderRadius.circular(50),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff4D63D5), width: 2),
                borderRadius: BorderRadius.circular(50),
              ),
              hintText: 'Type your email',
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Password",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          TextField(
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
              hintText: 'Type your password',
            ),
          ),
          const SizedBox(height: 20),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatsList()),
                );
              },
              child: const Text(
                "Log in",
                style: TextStyle(color: Colors.white),
              )),
          const SizedBox(height: 40),
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
    );
  }
}
