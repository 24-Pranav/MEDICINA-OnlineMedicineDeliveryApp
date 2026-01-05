import 'package:flutter/material.dart';

class ContactusScreen extends StatefulWidget {
  const ContactusScreen({super.key});

  @override
  State<ContactusScreen> createState() => _ContactusScreenState();
}

class _ContactusScreenState extends State<ContactusScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0x66343434),
              Color(0x26343434),
            ]),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Contact Us'),
        ),
        body: SafeArea(
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0, left: 24.0, right: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'Contact Us',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                ),
                Flexible(
                  child: ListView(
                    children: <Widget>[
                      Text(
                        'Slmedicinadelivery@gmail.com',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "281/A Stanley Thilakarathna Mawatha Nugegoda",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w200,
                            fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Telephone :011 -288888"),
                      Text("Mobile: 0713668997"),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Inquiries",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Name'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Email'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Comments'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                        onPressed: null,
                        child: Text(
                          "Submit",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
