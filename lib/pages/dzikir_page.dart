import 'package:flutter/material.dart';
import 'package:muslims_app/pages/dzikir/dzikirpagi_page.dart';
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
        backgroundColor: Color(0xff29286C),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff29286C),
              Color(0xffE69ED8),
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
                      imgUrl: "https://assets4.lottiefiles.com/packages/lf20_CAHmKs.json",
                      judul: "Pagi",
                    ),
                                        CardMenu(
                        onTapAction: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => TampilanPetang()));
                          // openNewSreen(context, TampilanPetang());
                        },
                        imgUrl:
                            "https://assets7.lottiefiles.com/packages/lf20_Ck4ANs.json",
                        judul: "Petang")
                  ],
                ),
              )
            )
          ],
        ),
      )
    );
  }
}