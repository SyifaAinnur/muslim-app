import 'package:flutter/material.dart';
import 'package:muslims_app/pages/page_menu.dart';
import 'package:muslims_app/pages/panduan/bacaanSholat_page.dart';
import 'package:muslims_app/pages/panduan/niatAdzan_page.dart';
import 'package:muslims_app/pages/panduan/niatSholat_page.dart';
import 'package:muslims_app/pages/panduan/niatWudhu_page.dart';
import 'package:muslims_app/theme.dart';
import 'package:muslims_app/widget/card_section.dart';

class PageSholat extends StatelessWidget {
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
