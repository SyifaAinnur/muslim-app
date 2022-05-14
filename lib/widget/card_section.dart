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
          width: 154,
          height: 180,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18), color: whiteColor),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                  horizontal: 1,
                  vertical: 1,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Center(
                        child: BackgroundImage(
                            imageUrl,
                          ),
                          
                      ),
                      
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(
                              name,
                              style: mediaumTextStyle.copyWith(fontSize: 20),
                            ),
                          
                        ],
                      )
                    ],
                  ),
            ),
        ));
  }
}
