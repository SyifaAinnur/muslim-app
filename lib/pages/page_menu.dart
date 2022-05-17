import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:muslims_app/api/aya_apiService.dart';
import 'package:muslims_app/pages/ceramah/page_ceramah.dart';
import 'package:muslims_app/pages/doa/page_doa.dart';
import 'package:muslims_app/pages/dzikir_page.dart';
import 'package:muslims_app/pages/hadits/page_hadits.dart';
import 'package:muslims_app/pages/headerView.dart';
import 'package:muslims_app/pages/models/ayat_of_the_day.dart';
import 'package:muslims_app/pages/models/location_services.dart';
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
import 'package:hijri/hijri_calendar.dart';

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

  void initState() {
    super.initState();
    LocationServices().getCoordinate();
  }

  AyaApiServices _ayaApiServices = AyaApiServices();

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    HijriCalendar.setLocal('ar');
    var _hijri = HijriCalendar.now();
    var day = DateTime.now();
    var format = DateFormat('EEE , d MMM yyyy');
    var formatted = format.format(day);
    var renunganProvider = Provider.of<RenunganProvider>(context);
    renunganProvider.getRenungan();
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: RichText(
            text: TextSpan(
              text: "Assalamualaikum,",
              style: TextStyle(fontSize: 18, color: Colors.black),
              children: [
                TextSpan(
                  text: "sahabat",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
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
                  "assets/bismillah.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff6DDCCF),
                  Color(0xff61E2B6),
                ]),
          ),
          child: Stack(children: [
            ClipPath(
              clipper: ClipPathClass(),
              child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/day_mode.png"),
                          fit: BoxFit.cover))),
            ),
            Container(
                margin: EdgeInsets.only(top: 90),
                child: Column(children: [
                  Column(children: [
                    ClipPath(
                        // clipper: ClipInfoClass(),
                        child: Container(
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.symmetric(horizontal: 5),

                            // decoration: BoxDecoration(
                            //   gradient: LinearGradient(
                            //     colors: [
                            //       Color(0xFF71EFA3),
                            //       Color(0xFFD2FDBB),
                            //     ],
                            //   ),
                            // ),
                            child: Card(
                                elevation: 0,
                                color: Colors.white.withOpacity(0.8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 220,
                                              margin: EdgeInsets.only(top: 5),
                                              child: FutureBuilder(
                                                future: LocationServices()
                                                    .getCoordinate(),
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    return Text(
                                                      snapshot.data.toString(),
                                                      style: TextStyle(
                                                        height: 1.5,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.black),
                                                      
                                                    );
                                                  } else {
                                                    return Text(
                                                      'Loading...',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black),
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  LocationServices()
                                                      .getCoordinate();
                                                },
                                                icon: Icon(
                                                  Icons.location_on,
                                                  color:
                                                      const Color(0xFF50CB93),
                                                )),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Divider(
                                          color: Colors.black,
                                        ),
                                        SizedBox(height: 10),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              formatted,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                            ),
                                            RichText(
                                              text: TextSpan(children: <
                                                  InlineSpan>[
                                                WidgetSpan(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Text(
                                                      _hijri.hDay.toString(),
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                                WidgetSpan(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(4.0),
                                                    child: Text(
                                                      _hijri.longMonthName,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                WidgetSpan(
                                                  child: Padding(
                                                    padding: EdgeInsets.all(4),
                                                    child: Text(
                                                      '${_hijri.hYear} AH',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ),
                                          ],
                                        ),
                                      ]),
                                )))),
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
                              padding: EdgeInsets.symmetric(horizontal: 9),
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
                                            builder: (context) => PageSholat(),
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
                                            builder: (context) => PageDzikir(),
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
                                            builder: (context) => PageHadits(),
                                          ),
                                        );
                                      },
                                      image: 'assets/mosque.png',
                                      title: 'Hadits\nPendek',
                                    ),
                                    MenuItem(
                                      onTapAction: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => PageCeramah(),
                                          ),
                                        );
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
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsetsDirectional.only(top: 10, bottom: 20),
                      child: Column(
                        children: [
                          FutureBuilder<AyaOfTheDay>(
                            future: _ayaApiServices.getAyaOfTheDay(),
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                  return Icon(Icons.sync_problem);
                                case ConnectionState.waiting:
                                case ConnectionState.active:
                                  return CircularProgressIndicator();
                                case ConnectionState.done:
                                  return Container(
                                    margin: EdgeInsetsDirectional.all(16),
                                    padding: EdgeInsetsDirectional.all(20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(32),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 3,
                                            spreadRadius: 1,
                                            offset: Offset(0, 1),
                                          )
                                        ]),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Quran Ayat of the Day",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          thickness: 0.5,
                                        ),
                                        Text(
                                          snapshot.data.arText,
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 18),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          snapshot.data.enTran,
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 18),
                                          textAlign: TextAlign.center,
                                        ),
                                        RichText(
                                          text: TextSpan(children: <InlineSpan>[
                                            WidgetSpan(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  snapshot.data.surNumber
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ),
                                            ),
                                            WidgetSpan(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    snapshot.data.surEnName,
                                                    style: TextStyle(
                                                        fontSize: 16)),
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ],
                                    ),
                                  );
                              }
                            },
                          )
                        ],
                      ),
                    ),
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
