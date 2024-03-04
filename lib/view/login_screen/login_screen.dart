// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharepref_sample/view/home_page/home_page.dart';
import 'package:sharepref_sample/view/reg_screen/reg_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Welcome Back!",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
              Text(
                "login to your existent account of pushpak courier",
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
              //
              ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    String? savedUsername = prefs.getString("username");

                    String? savedPswd = prefs.getString("pswd");

                    if (c1.text == savedUsername && c2.text == savedPswd) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.green,
                          content: Text("login success")));
                      prefs.setBool("isLogged", true);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                          (route) => false);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("login failed")));
                    }
                  },
                  child: Text("Login")),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    // navigate to registor screen
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ));
                  },
                  child: Text("register now"))
            ],
          ),
        ),
      ),
    );
  }
}
