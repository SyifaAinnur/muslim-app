import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:muslims_app/model/asmaulhusna.dart';

class ServiceData {
  var listasmaulhusna = 'assets/data/asmaul-husna.json';

    Future<List<AllAsmaul>> loadAsmaul() async {
    var response = await rootBundle.loadString(listasmaulhusna);
    var res = json.decode(response);
    Iterable data = res['data'];
    return data.map((model) => AllAsmaul.fromJson(model)).toList();
  }


}