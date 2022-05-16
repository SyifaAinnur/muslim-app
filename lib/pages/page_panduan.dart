import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:muslims_app/pages/models/location_services.dart';
import 'package:muslims_app/pages/page_menu.dart';
import 'package:muslims_app/pages/panduan/bacaanSholat_page.dart';
import 'package:muslims_app/pages/panduan/niatAdzan_page.dart';
import 'package:muslims_app/pages/panduan/niatSholat_page.dart';
import 'package:muslims_app/pages/panduan/niatWudhu_page.dart';
import 'package:muslims_app/theme.dart';
import 'package:muslims_app/widget/card_section.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class PageSholat extends StatefulWidget {
  @override
  State<PageSholat> createState() => _PageSholatState();
}

class _PageSholatState extends State<PageSholat> {
  void initState() {
    super.initState();
    LocationServices().getCoordinate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Panduan Sholat'),
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
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            cardPage(context),
                            SizedBox(
                              height: 20,
                            ),
                            cardPages(context),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget cardPage(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            CardSection(
              onTapAction: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NiatWudhu()));
              },
              name: 'Niat Wudhu',
              imageUrl:
                  "https://assets10.lottiefiles.com/packages/lf20_nbrlt9yz.json",
            ),
            CardSection(
              onTapAction: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NiatAdzan()));
              },
              name: 'Niat adzan',
              imageUrl:
                  "https://assets4.lottiefiles.com/packages/lf20_8ggiuj23.json",
            ),
          ],
        ),
      
    );
  }

  Widget cardPages(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            CardSection(
              onTapAction: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NiatSholat()));
              },
              name: 'Niat Sholat',
              imageUrl:
                  "https://assets8.lottiefiles.com/packages/lf20_bpj45jpp.json",
            ),
            CardSection(
              onTapAction: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BacaanSholat()));
              },
              name: 'Panduan Sholat',
              imageUrl:
                  "https://assets8.lottiefiles.com/packages/lf20_sk5C0K.json",
            ),
          ],
        ),
      
    );
  }
}
