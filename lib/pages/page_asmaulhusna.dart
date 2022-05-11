import 'package:flutter/material.dart';
import 'package:muslims_app/pages/models/asmaulhusna.dart';
import 'package:muslims_app/pages/page_menu.dart';
import 'package:muslims_app/theme.dart';


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
          child: ListView.builder(
            itemCount: asmaLatin.length,
            itemBuilder: (BuildContext context,  int position) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.white,
                  elevation: 0,
                  child: ListTile(
                    onTap: () {},
                    title: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            asmaArab[position],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25
                            )
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            asmaLatin[position],
                              textAlign: TextAlign.center,
                              style: regularTextStyle
                          ),
                        )     
                      ],
                    ),
                    
                    subtitle: Text(
                      asmaArti[position],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            }
          ),
        ),
      )
    );
  }
}