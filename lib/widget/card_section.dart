import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:muslims_app/theme.dart';
import 'package:muslims_app/widget/background_image.dart';

class CardSection extends StatelessWidget {
  final String name;
  final String imageUrl;
  final Function onTapAction;

  CardSection({this.name, @required this.imageUrl, @required this.onTapAction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTapAction,
        child: Container(
          width: 200,
          height: 243,
          margin: EdgeInsets.only(left: 24),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18), color: whiteColor),
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BackgroundImage(
                    imageUrl,
                  ),
                ),
                Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(
                              name,
                              style: mediaumTextStyle.copyWith(fontSize: 20),
                            ),
                          
                        ],
                      ),
                    )
              ],
            )
          ]),
        ));
  }
}
