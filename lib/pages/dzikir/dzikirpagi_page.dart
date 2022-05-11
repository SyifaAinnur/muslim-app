import 'package:flutter/material.dart';
import 'package:muslims_app/pages/models/dzikir/data_dzikir.dart';
import 'package:muslims_app/widget/dzikir_detail_item.dart';
import 'package:page_indicator/page_indicator.dart';

class TampilanPagi extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dzikir Pagi"),
      ),
      body: PageIndicatorContainer(
        child: PageView.builder(
          itemCount: dzikirPagi.length,
          itemBuilder: (context, index) {
              String judul = dzikirPagi[index].judul;
              String arab = dzikirPagi[index].bacaanArab;
              String arti = dzikirPagi[index].arti;

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