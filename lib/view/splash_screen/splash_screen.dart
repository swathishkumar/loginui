// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharepref_sample/view/home_page/home_page.dart';
import 'package:sharepref_sample/view/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () async {
      SharedPreferences perfs = await SharedPreferences.getInstance();
      bool isLogged = perfs.getBool("isLogged") ?? false;
      if (isLogged == true) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("asset/unnamed.png"))),
            ),
            SizedBox(
              height: 15,
            ),
            CircularProgressIndicator(
              color: const Color.fromARGB(255, 43, 93, 178),
            )
          ],
        ),
      ),
    );
  }
}
