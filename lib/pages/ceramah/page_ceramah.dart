import 'package:flutter/material.dart';
import 'package:muslims_app/theme.dart';
import 'package:muslims_app/pages/page_menu.dart';
import 'package:provider/provider.dart';
import 'package:muslims_app/model/berita.dart';
import 'package:muslims_app/providers/berita_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:muslims_app/widget/berita_item.dart';

class PageCeramah extends StatefulWidget {
  final Berita berita;
  PageCeramah({this.berita});

  @override
  _PageCeramahState createState() => _PageCeramahState();
}

class _PageCeramahState extends State<PageCeramah> {
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var beritaProvider = Provider.of<BeritaProvider>(context);
    beritaProvider.getBerita();

    launchURL(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        // throw (url);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MenuPage(),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Ceramah Pilihan"),
        elevation: 0,
        backgroundColor: Color(0xff6DDCCF),
        leading: GestureDetector(
          onTap: () {
            /* Write listener code here */
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MenuPage()));
          },
          child: Icon(Icons.arrow_back // add custom icons also
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
                Color(0xff6DDCCF),
                Color(0xff61E2B6),
              ],
            ),
          ),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: edge,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Berbagai Manfaat yang Akan Kita Dapat\nDari Mendengarkan Ceramah Agama.",
                      style: whiteTextStyle.copyWith(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Yuk, kita mulai perubahan mulai hari ini dengan kegiatan -\nkegiatan yang bisa menambah keilmuan kita.",
                      style: greyTextStyle.copyWith(fontSize: 14),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: edge,
                ),
                child: FutureBuilder(
                  future: beritaProvider.getBerita(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Berita> data = snapshot.data;
                      int index = 0;
                      return Column(
                        children: data.map((item) {
                          return Container(
                            margin: EdgeInsets.only(
                              top: index == 1 ? 0 : 15,
                            ),
                            child: InkWell(
                              onTap: () {
                                launchURL(
                                    "https://www.youtube.com/watch?v=5qap5aO4i9A");
                              },
                              child: BeritaItem(item),
                            ),
                          );
                        }).toList(),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
