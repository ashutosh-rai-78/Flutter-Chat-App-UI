import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double? h;

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
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
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
              suffixIcon: const Icon(Icons.hide_source),
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
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
                    color: Colors.blue),
              )),
          const SizedBox(height: 20),
          ElevatedButton(
              // ignore: prefer_const_constructors
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                elevation: 5,
                minimumSize: const Size(double.infinity, 50),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
              onPressed: () {},
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
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                /*defining default style is optional */
                children: <TextSpan>[
                  TextSpan(
                      text: ' Sign up',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
