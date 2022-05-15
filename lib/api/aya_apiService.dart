import 'dart:convert';
import 'dart:math';
import 'package:muslims_app/pages/models/ayat_of_the_day.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:muslims_app/pages/models/surah.dart';


class AyaApiServices{

  final endPointUrl ="http://api.alquran.cloud/v1/surah";
  List<Surah> list = [];

  Future<AyaOfTheDay> getAyaOfTheDay() async {

    // for random Aya we need to generate random number
    // (1,6237) from 1 to 6236
    // Random Aya
    String url = "https://api.alquran.cloud/v1/ayah/${random(1,6237)}/editions/quran-uthmani,en.asad,en.pickthall";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
        return AyaOfTheDay.fromJSON(json.decode(response.body));
    } else {
      print("Failed to load");
      throw Exception("Failed  to Load Post");
    }
  }
  random(min, max){
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }
}