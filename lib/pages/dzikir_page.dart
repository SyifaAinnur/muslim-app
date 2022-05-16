import 'package:flutter/material.dart';
import 'package:muslims_app/pages/dzikir/dzikirSholat_page.dart';
import 'package:muslims_app/pages/dzikir/dzikirpagi_page.dart';
import 'package:muslims_app/pages/dzikir/dzikirpetang_page.dart';
import 'package:muslims_app/theme.dart';
import 'package:muslims_app/pages/page_menu.dart';
import 'package:lottie/lottie.dart';
import 'package:muslims_app/widget/dzikir_item.dart';

class PageDzikir extends StatelessWidget {
  // const PageDzikir({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Dzikir'),
          elevation: 0,
          backgroundColor: Color(0xff6DDCCF),

        ),
        body: Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CardMenu(
                      onTapAction: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TampilanPagi()));
                      },
                      imgUrl:
                          "https://assets4.lottiefiles.com/packages/lf20_CAHmKs.json",
                      judul: "Dzikir Pagi",
                    ),
                    CardMenu(
                        onTapAction: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TampilanPetang()));
                        },
                        imgUrl:
                            "https://assets7.lottiefiles.com/packages/lf20_Ck4ANs.json",
                        judul: "Dzikir Petang"),
                    CardMenu(
                        onTapAction: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TampilanSholat()));
                        },
                        imgUrl:
                            "https://assets7.lottiefiles.com/packages/lf20_Ck4ANs.json",
                        judul: "Dzikir Sesudah Sholat")
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
