import 'package:flutter/material.dart';
import 'package:muslims_app/pages/page_menu.dart';
import 'package:muslims_app/theme.dart';
import 'doa.dart';
import 'doa_data.dart';


class PageDoa extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(
          centerTitle: true,
          title: Text("Do'a Harian"),
          elevation: 0,
          backgroundColor: Color(0xff6DDCCF),
        ),
      body: SafeArea(
        child: Container(
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
          child: ListView.builder(
            itemCount: isiDoa.length,
            itemBuilder: (BuildContext context, int index) {
              final title = namaDoa[index].toString();
              final subTitle = isiDoa[index].toString();
              final arti = artiDoa[index].toString();
              return Container(
                child: Padding(
                  padding: EdgeInsets.all(7.5),
                  child: Card(
                    elevation: 6.0,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 000,
                          padding: EdgeInsets.all(10),
                          child: ListItem(title, subTitle, arti),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

ListItem(String arti, String title, String subTitle) {
  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          arti,
          style: blackTextStyle.copyWith(fontSize: 20),
          textAlign: TextAlign.end,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: mediaumTextStyle.copyWith(fontSize: 20),
          textAlign: TextAlign.end,
        ),
        Text(
          subTitle,
          textAlign: TextAlign.end,
        ),
      ],
    ),
  );
}