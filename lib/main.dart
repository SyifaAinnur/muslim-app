import 'package:flutter/material.dart';
import 'package:muslims_app/pages/page_splash.dart';
import 'package:muslims_app/pages/renungan/provider/renungan_provider.dart';
import 'package:muslims_app/providers/berita_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RenunganProvider(),
      child: ChangeNotifierProvider(
        create: (context) => BeritaProvider(),
      child: MaterialApp(
        home: PageSplash(),
        debugShowCheckedModeBanner: false,
      ),
      )
    );
  }
}
