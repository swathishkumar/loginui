// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharepref_sample/view/login_screen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("asset/unnamed.png"))),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "create new account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: c1,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                controller: c2,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    //
                    if (c1.text.isNotEmpty && c2.text.isNotEmpty) {
                      preferences.setString("username", c1.text);
                      preferences.setString("pswd", c2.text);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("Username and password are required"),
                      ));
                    }
                  },
                  child: Text("Register")),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  },
                  child: Text("login now"))
            ],
          ),
        ),
      ),
    );
  }
}
