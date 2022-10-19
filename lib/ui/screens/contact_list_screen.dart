import 'package:flutter/material.dart';
import 'package:flutter_chat_app_ui/di/get_it.dart';
import 'package:flutter_chat_app_ui/firebase/auth.dart';
import 'package:flutter_chat_app_ui/ui/screens/login_screen.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {

  late Auth auth;

  @override
  void initState() {
    auth = locator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Whatsapp Copy'),
        actions: [
          IconButton(onPressed: (){
            auth.logout();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
          }, icon: const Icon(Icons.logout))
        ],
      ),
      // appBar: AppBar(),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            // color: Colors.amber,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Container(
                  color: Colors.amber,
                  child: Image.asset(
                    height: 60,
                    width: 60,
                    fit: BoxFit.fill,
                    "assets/images/p1.jpg",
                  ),
                ),
              ),
              title: Text(
                'Ashutosh Rai',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text("Busy"),
              trailing: Icon(
                Icons.settings,
                color: Color(0xff4D63D5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
