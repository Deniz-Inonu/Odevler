import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import '../modeller/hava_modelleri.dart';
import 'package:http/http.dart ' as http;

class HavaVerisi {
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  HavaVerisi(this.apiKey);

  Future<HavaDurumu> getHavaDurumu(String sehirIsmi) async {
    final response = await http
        .get(Uri.parse('$BASE_URL?q=$sehirIsmi&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return HavaDurumu.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Hava durumu yüklenemedi!');
    }
  }

  //Bulunduğu konumu isteme

  Future<String> getSimdikiSehir() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    //Simdiki konumu getir
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    //konum isaretleri listele
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    //ilk konum isaretinden   sehri cikar
    String? city = placemarks[0].locality;

    return city ?? ""; // olmadi ise bos gönder
  }
}
