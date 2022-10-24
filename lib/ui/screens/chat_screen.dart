import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app_ui/di/get_it.dart';
import 'package:flutter_chat_app_ui/firebase/auth.dart';
import 'package:flutter_chat_app_ui/models/rt_db_model.dart';
import 'package:flutter_chat_app_ui/ui/screens/login_screen.dart';
import 'package:flutter_chat_app_ui/ui/widgets/auth_text_field.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late DatabaseReference ref;
  late Auth auth;
  final List<RTModel> list = [];
  late StreamSubscription scrip;
  late TextEditingController controller;
  final DateFormat formatter = DateFormat('dd-MM-yyyy hh:mm a');

  @override
  void initState() {
    ref = FirebaseDatabase.instance.ref().child("chats");

    auth = locator();
    controller = TextEditingController();
    super.initState();
    readData();
  }

  void readData() {
    scrip = ref.onChildAdded.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          list.add(RTModel.fromSnanpshot(event.snapshot));
        });
        print(event.snapshot.value);
      }
    });
  }

  @override
  void dispose() {
    scrip.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Whatsapp Copy'),
        actions: [
          IconButton(
              onPressed: () {
                auth.logout();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final item = list[index];
                if (item.email == auth.requireCurrentUser().email) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 1.8,
                        right: 10,
                        bottom: 10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.message,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            formatter.format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    item.timestamp)),
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Container(
                  padding: const EdgeInsets.all(8),
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 1.8,
                      left: 10,
                      bottom: 10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.email,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.primary),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        item.message,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          formatter.format(DateTime.fromMillisecondsSinceEpoch(
                              item.timestamp)),
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    ],
                  ),
                );
                return Row(
                  children: [
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: Container(
                        height: 50,
                        color: Colors.black,
                      ),
                    ),
                    const Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: SizedBox(),
                    )
                  ],
                );
                /*return ListTile(
                title: Text(item.email),
                subtitle: Text(item.message),
                trailing: Text(item.timestamp.toString()),
              );*/
              },
              itemCount: list.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: AuthTextField(
                  hint: "Message...",
                  controller: controller,
                )),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {
                      ref.push().set({
                        "from": auth.requireCurrentUser().email.toString(),
                        "message": controller.text,
                        "timestamp": DateTime.now().millisecondsSinceEpoch,
                      });
                    },
                    icon: const Icon(Icons.send))
              ],
            ),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
