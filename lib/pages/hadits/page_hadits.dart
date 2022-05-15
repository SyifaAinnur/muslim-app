import 'package:flutter/material.dart';
import 'package:muslims_app/pages/hadits/hadits.dart';
import 'package:muslims_app/pages/hadits/hadits_data.dart';
import 'package:muslims_app/pages/models/dzikir/data_dzikir.dart';
import 'package:muslims_app/widget/dzikir_detail_item.dart';
import 'package:page_indicator/page_indicator.dart';

class PageHadits extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dzikir Pagi"),
      ),
      body: PageIndicatorContainer(
        child: PageView.builder(
          itemCount: hadits.length,
          itemBuilder: (context, index) {
              String judul = hadits[index].judul;
              String arab = hadits[index].bacaanArab;
              String arti = hadits[index].arti;

              return ItemDzikir(judul, arab, arti);
          },
        ),
        length: 22,
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