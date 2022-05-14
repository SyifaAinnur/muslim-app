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
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          location(context),
                          SizedBox(
                            height: 20,
                          ),
                          cardPage(context),
                          SizedBox(
                            height: 20,
                          ),
                          cardPages(context),
                        ],
                      )
                    ],
                  ),
                ),
              )
              
            
          ],
        ),
      )
      
    );
  }

  Widget location(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 120.0,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF0081a0),
                  borderRadius: BorderRadius.circular(30.0)
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            LocationServices().getCoordinate();
                          }, 
                          icon: Icon(Icons.location_on,)
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  DateFormat.yMMMMEEEEd().add_jm().format(DateTime.now()),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: FutureBuilder(
                                  future: LocationServices().getCoordinate(),
                                  builder: (context, snapshot){
                                    if(snapshot.hasData){
                                      return Text(snapshot.data.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),);
                                    }else{
                                      return Text('Loading...', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),);
                                    }
                                  },
                            
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
    );
  }

  Widget cardPage(BuildContext context) {
    return Container(
       child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CardSection(
                  onTapAction: () {
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NiatWudhu()));
                  },
                  name: 'Niat Wudhu',
                  imageUrl:
                      "https://assets10.lottiefiles.com/packages/lf20_nbrlt9yz.json",
                      
                ),
                CardSection(
                  onTapAction: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => NiatAdzan()));
                  },
                  name: 'Niat adzan',
                  imageUrl:
                      "https://assets10.lottiefiles.com/packages/lf20_nbrlt9yz.json",
                      
                ),
              ],
            ),
      ),
    );
  }

    Widget cardPages(BuildContext context) {
    return Container(
       child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                
                CardSection(
                  onTapAction: () {
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NiatSholat()));
                  },
                  name: 'Niat Sholat',
                  imageUrl:
                      "https://assets10.lottiefiles.com/packages/lf20_nbrlt9yz.json",
                ),
                CardSection(
                  onTapAction: () {
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BacaanSholat()));
                  },
                  name: 'Panduan Sholat',
                  imageUrl:
                      "https://assets8.lottiefiles.com/packages/lf20_sk5C0K.json",
                ),
              ],
            ),
      ),
    );
  }
}
