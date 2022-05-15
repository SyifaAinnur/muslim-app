import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:muslims_app/pages/doa/page_doa.dart';
import 'package:muslims_app/pages/dzikir_page.dart';
import 'package:muslims_app/pages/headerView.dart';
import 'package:muslims_app/pages/juz-ama/page_juz-ama.dart';
import 'package:muslims_app/pages/page_asmaulhusna.dart';
import 'package:muslims_app/pages/page_panduan.dart';
import 'package:muslims_app/pages/page_main.dart';
import 'package:muslims_app/pages/qiblat/qiblat_page.dart';
import 'package:muslims_app/pages/quran/image_slideshow.dart';
import 'package:muslims_app/pages/renungan/model/renungan.dart';
import 'package:muslims_app/pages/renungan/provider/renungan_provider.dart';
import 'package:muslims_app/pages/renungan/widget/renungan_item.dart';
import 'package:muslims_app/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:muslims_app/widget/menu_item.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class MenuPage extends StatefulWidget {
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var renunganProvider = Provider.of<RenunganProvider>(context);
    renunganProvider.getRenungan();
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: RichText(
            text: TextSpan(
              text: "Hai, ",
              style: TextStyle(
                fontSize: 18,
              ),
              children: [
                TextSpan(
                  text: "Syifa",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(right: 20),
                width: 30,
                height: 30,
                child: Image.asset(
                  "assets/asr.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
          backgroundColor: Color(0xFFEC2028),
          elevation: 0,
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff29286C),
                  Color(0xffE69ED8),
                ]),
          ),
          child: Stack(children: [
            ClipPath(
              clipper: ClipPathClass(),
              child: Container(
                height: 250,
                width: Get.width,
                color: Color(0xFFEC2028),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(children: [
                  Column(children: [
                    ClipPath(
                        clipper: ClipInfoClass(),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFE52D27),
                                Color(0xFFB31217),
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Loacation",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.location_on)
                                ],
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Sisa Pulsa Anda",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Rp34.000",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Isi Pulsa",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFFF7B731),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Divider(
                                color: Colors.black,
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ))
                  ]),
                  Column(
                    
                    children: [
                      Center(
                        
                        child: ClipRRect(
                            child: Container(
                              
                              margin: EdgeInsets.only(top: 20),
                              width: 360,
                              height: 200,
                              
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 14),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MenuItem(
                                        onTapAction: () {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (_) {
                                                return PageMain();
                                              },
                                            ),
                                          );
                                        },
                                        image: 'assets/quran.png',
                                        title: 'Al-Qur\'an',
                                      ),
                                      MenuItem(
                                        onTapAction: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PageSholat(),
                                            ),
                                          );
                                        },
                                        image: 'assets/praying.png',
                                        title: 'Panduan\nSholat',
                                      ),
                                      MenuItem(
                                        onTapAction: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PageDzikir(),
                                            ),
                                          );
                                        },
                                        image: 'assets/muslim.png',
                                        title: 'Dzikir',
                                      ),
                                      MenuItem(
                                        onTapAction: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PageAsmaulHusna(),
                                            ),
                                          );
                                        },
                                        image: 'assets/bismillah.png',
                                        title: 'Asmaul\nHusna',
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MenuItem(
                                        onTapAction: () {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (_) {
                                                return PageQiblat();
                                              },
                                            ),
                                          );
                                        },
                                        image: 'assets/mecca.png',
                                        title: 'Qiblat',
                                      ),
                                      MenuItem(
                                        onTapAction: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => PageDoa(),
                                            ),
                                          );
                                        },
                                        image: 'assets/pray.png',
                                        title: 'Doa Harian',
                                      ),
                                      MenuItem(
                                        onTapAction: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PageJuzama(),
                                            ),
                                          );
                                        },
                                        image: 'assets/mosque.png',
                                        title: 'Khazanah',
                                      ),
                                      MenuItem(
                                        onTapAction: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) => PageCeramah(),
                                          //   ),
                                          // );
                                        },
                                        image: 'assets/man.png',
                                        title: 'Ceramah',
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                ]),
                              ),
                            ),

                            //menu kedua
                          ),
                        ),
                    ],
                  ),
                ]))
          ]),
        ));
  }
}

class ClipInfoClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width - 80, size.height);
    path.lineTo(size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
