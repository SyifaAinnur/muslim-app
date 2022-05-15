
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:muslims_app/model/model.dart';

class BeritaProvider extends ChangeNotifier {
  getBerita() async {
    String uri = "https://arshad-app.herokuapp.com/api/arshad";
    var result = await http.get(Uri.parse(uri));

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Berita> berita = data.map((item) => Berita.fromJson(item)).toList();
      return berita;
    } else {
      return <Berita>[];
    }
  }
}