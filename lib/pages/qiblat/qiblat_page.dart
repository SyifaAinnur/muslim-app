import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:muslims_app/pages/page_menu.dart';
import 'package:muslims_app/widget/loading_indicator.dart';
import 'package:muslims_app/widget/qiblah_compas.dart';
import 'package:muslims_app/widget/qiblah_maps.dart';


class PageQiblat extends StatelessWidget {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(
          centerTitle: true,
          title: Text('Qiblat'),
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
            )
          ),
          child: FutureBuilder(
            future: _deviceSupport,
              builder: (_, AsyncSnapshot<bool> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return LoadingIndicator();
              if (snapshot.hasError)
                return Center(
                  child: Text("Error: ${snapshot.error.toString()}"),
                );

              if (snapshot.data)
                return QiblahCompass();
              else
                return QiblahMaps();
            },
          ),
        )
      )
    );
  }
}