import 'package:flutter/material.dart';
import 'package:muslims_app/api/asmaulHusna_service.dart';
import 'package:muslims_app/model/asmaulhusna.dart';
import 'package:muslims_app/pages/models/asmaulhusna.dart';
import 'package:muslims_app/pages/page_menu.dart';
import 'package:muslims_app/theme.dart';
import 'package:muslims_app/widget/cardasmaul.dart';
import 'package:pk_skeleton/pk_skeleton.dart';


class PageAsmaulHusna extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff29286C),
        centerTitle: true,
        elevation: 0,
        title: Text("Asmaul Husna"),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MenuPage()));
          },
          child: Icon(
            Icons.arrow_back
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff29286C),
                  Color(0xffE69ED8),
                ]
            ),
          ),
        child: FutureBuilder<List<AllAsmaul>>(
          future: ServiceData().loadAsmaul(),
          builder: (c, snapshot) {
            return snapshot.hasData
                ? Directionality(
                    textDirection: TextDirection.rtl,
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      children: snapshot.data
                          .map((asm) => new CardAsmaul(
                                arabic: asm.arabic,
                                title: asm.latin,
                                translate: asm.translationId,
                              ))
                          .toList(),
                    ))
                : PKCardPageSkeleton(
                    totalLines: 5,
                  );
          },
        ),
        ),
      )
    );
  }
}