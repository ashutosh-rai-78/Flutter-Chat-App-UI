import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app_ui/di/get_it.dart';
import 'package:flutter_chat_app_ui/ui/screens/chat_screen.dart';
import 'package:flutter_chat_app_ui/ui/screens/contact_list_screen.dart';
import 'package:flutter_chat_app_ui/ui/screens/signup_screen.dart';
import 'package:flutter_chat_app_ui/ui/screens/splash_screen.dart';
import 'package:flutter_chat_app_ui/ui/screens/user_profile_setup_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initializeDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      // home: LoginScreen(),
      // home: SignUpScreen(),
      // home: ContactListScreen(),
      // home: UserProfileSetupScreen(),
      home: SplashScreen(),
    );
  }
}
