// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController c1 = TextEditingController();

  String? savedData = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: c1,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () async {
// shared prefs
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  //  to save data to shared preferences
                  preferences.setString("text", c1.text);
                  setState(() {});
                },
                child: Text("save")),
            SizedBox(height: 100),
            //
            // Text(c1.text),
            Text(savedData.toString()),
            SizedBox(height: 50),
            ElevatedButton(
                onPressed: () async {
                  //  again created object for shared prefs bcoz it is in function above
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  // to get data
                  // preferences.get("text");
                  savedData = preferences.getString("text");
                  setState(() {});
                },
                child: Text("get"))
          ],
        ),
      ),
    );
  }
}
