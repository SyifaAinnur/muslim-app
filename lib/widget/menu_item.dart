import 'package:flutter/material.dart';
import 'package:muslims_app/theme.dart';

class MenuItem extends StatelessWidget {
  final Function onTapAction;
  final String image;
  final String title;
  MenuItem({
    this.image,
    this.title,
    this.onTapAction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapAction,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 90,
          width: 80,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(9.0),
                child: Image.asset(
                  this.image,
                  width: 30,
                ),
              ),
              Text(this.title,
                  style: mediaumTextStyle, textAlign: TextAlign.center)
            ],
          ),
        ),
      ),
    );
  }
}