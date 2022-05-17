import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:muslims_app/pages/page_menu.dart';
import 'package:muslims_app/theme.dart';
import 'package:progress_indicators/progress_indicators.dart';

class PageSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    startApp(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 400,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff6DDCCF),
                  Color(0xff61E2B6),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Lottie.asset('assets/splash.json', width: 300),
                Text(
                  "Muslim App",
                  style: whiteTextStyle.copyWith(fontSize: 25),
                ),
                JumpingDotsProgressIndicator(
                  fontSize: 32,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          // Align(
          //   alignment: Alignment(0, 0.85),
          //   child: JumpingDotsProgressIndicator(
          //     fontSize: 32,
          //     color: Colors.white,
          //   ),
          // )
        ],
      ),
    );
  }

  startApp(BuildContext context) {
    Timer(
      Duration(seconds: 10),
      () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          return MenuPage();
        }));
      },
    );
  }
}