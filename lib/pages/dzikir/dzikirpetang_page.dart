import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:muslims_app/pages/models/dzikir/data_dzikir.dart';
import 'package:muslims_app/widget/dzikir_detail_item.dart';

class TampilanPetang extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6DDCCF),
        centerTitle: true,
        title: Text("Dzikir Petang"),
      ),
      body: PageIndicatorContainer(
        child: PageView.builder(
          itemCount: dzikirPetang.length,
          itemBuilder: (context, index) {
              String judul = dzikirPetang[index].judul;
              String arab = dzikirPetang[index].bacaanArab;
              String arti = dzikirPetang[index].arti;

              return ItemDzikir(judul, arab, arti);
          },
        ),
        length: 20,
        align: IndicatorAlign.top,
        indicatorSpace: 2.0,
        padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
        indicatorColor: Colors.black,
        indicatorSelectorColor: Colors.blue,
        //shape: IndicatorShape.circle(size: 10),
        shape: IndicatorShape.roundRectangleShape(
            size: Size.square(12), cornerSize: Size.square(3)),
        // shape: IndicatorShape.oval(size: Size(12, 8)),
      ),
    );
  }
}