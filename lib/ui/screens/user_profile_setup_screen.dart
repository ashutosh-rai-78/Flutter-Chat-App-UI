import 'package:flutter/material.dart';
import 'package:flutter_chat_app_ui/di/get_it.dart';
import 'package:flutter_chat_app_ui/firebase/auth.dart';
import 'package:flutter_chat_app_ui/ui/screens/chat_screen.dart';
import 'package:flutter_chat_app_ui/ui/widgets/auth_text_field.dart';

class UserProfileSetupScreen extends StatefulWidget {
  const UserProfileSetupScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileSetupScreen> createState() => _UserProfileSetupScreenState();
}

class _UserProfileSetupScreenState extends State<UserProfileSetupScreen> {
  late TextEditingController firstController;
  late TextEditingController lastController;
  late Auth auth;
  late bool isLoading = true;

  @override
  void initState() {
    auth = locator();
    firstController = TextEditingController();
    lastController = TextEditingController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        isLoading = false;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile Setup"),
          centerTitle: true,
        ),
        body: isLoading ? Center(child: CircularProgressIndicator()) :  Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "First Name",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(height: 5),
                  AuthTextField(
                      hint: "Enter your First name",
                      controller: firstController,
                      type: AuthTextFieldType.text,
                      validator: (value) {
                        if (value == null) {
                          return 'please enter name';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Last Name",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(height: 5),
                  AuthTextField(
                      hint: "Enter your Last name",
                      controller: lastController,
                      type: AuthTextFieldType.text,
                      validator: (value) {
                        if (value == null) {
                          return 'please enter your last name';
                        }
                      }),

                  SizedBox(
                    height: 20,
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 35, vertical: 12)),
                      ),
                      child: Text("Save", style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Theme.of(context).colorScheme.primary
                      ),),
                      onPressed: () {
                        final code = auth.requireCurrentUser();
                        code.updateDisplayName("${firstController.text} ${lastController.text}");
                        if (!mounted) return;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChatScreen()),
                        );
                      },
                    ),
                  )
                ],
              ),
            )));
  }
}
