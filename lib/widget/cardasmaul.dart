import 'package:flutter/material.dart';

class CardAsmaul extends StatelessWidget {
  const CardAsmaul({
    Key key,
    @required this.title,
    @required this.arabic,
    @required this.translate,
  }) : super(key: key);
  final String title;
  final String arabic;
  final String translate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              arabic,
              style: TextStyle(fontSize: 30.0,
              color: Color(0xff393E46)
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(title),
            SizedBox(
              height: 20.0,
            ),
            Text(
              translate,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10,
              color: Color(0xff686D76)
              ),
            ),
          ],
        ),
      ),
    );
  }
}