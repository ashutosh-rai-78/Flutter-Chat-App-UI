import 'package:flutter/material.dart';
import 'package:flutter_chat_app_ui/di/get_it.dart';
import 'package:flutter_chat_app_ui/firebase/auth.dart';
import 'package:flutter_chat_app_ui/ui/screens/contact_list_screen.dart';
import 'package:flutter_chat_app_ui/ui/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Auth auth;
  @override
  void initState() {
    auth = locator();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (auth.hasCurrentUser()) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return ContactListScreen();
        }));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
