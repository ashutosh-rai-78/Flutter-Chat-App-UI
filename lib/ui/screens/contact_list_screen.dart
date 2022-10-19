import 'package:flutter/material.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
