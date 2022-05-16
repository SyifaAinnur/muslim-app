import 'package:flutter/material.dart';
import 'package:muslims_app/pages/models/dzikir/data_dzikir.dart';
import 'package:muslims_app/widget/dzikir_detail_item.dart';
import 'package:page_indicator/page_indicator.dart';

class TampilanSholat extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6DDCCF),
        centerTitle: true,
        title: Text("Dzikir Setelah Sholat"),
      ),
      body: PageIndicatorContainer(
        child: PageView.builder(
          itemCount: dzikirSetelahSholat.length,
          itemBuilder: (context, index) {
              String judul = dzikirSetelahSholat[index].judul;
              String arab = dzikirSetelahSholat[index].bacaanArab;
              String arti = dzikirSetelahSholat[index].arti;

              return ItemDzikir(judul, arab, arti);
          },
        ),
        length: 3,
        align: IndicatorAlign.top,
        indicatorSpace: 2.0,
        padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
        indicatorColor: Colors.black,
        indicatorSelectorColor: Colors.blue,
        shape: IndicatorShape.roundRectangleShape(
          size: Size.square(12),
          cornerSize: Size.square(3)
        ),
      ),
    );
  }
}