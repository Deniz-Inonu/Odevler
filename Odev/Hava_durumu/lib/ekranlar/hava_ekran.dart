import 'package:flutter/material.dart';
import 'package:hava_durumu/modeller/hava_modelleri.dart';
import 'package:hava_durumu/veri_cek/hava_verisi_cek.dart';

class HavaEkran extends StatefulWidget {
  const HavaEkran({super.key});

  @override
  State<StatefulWidget> createState() => _HavaEkraniDurumu();
}

class _HavaEkraniDurumu extends State<HavaEkran> {
  // api key
  final _havaVerisi = HavaVerisi('aee79c6f02633da2ec587d10984aec13');

  HavaDurumu? _havadurumu; // nesne

  //hava durumunu getir.
  _havaVerisiCek() async {
    //simdiki sehri getir
    String sehirIsmi = await _havaVerisi.getSimdikiSehir();

    //Havanı durumu -sehir icin
    try {
      final havadurumu = await _havaVerisi.getHavaDurumu(sehirIsmi);
      setState(() {
        _havadurumu = havadurumu;
      });
    }

    //hata durumu
    catch (e) {
      print(e);
    }

    //animasyonlar

    //init state
    @override
    void initState() {
      super.initState();
    }

    //veri cek
    _havaVerisiCek();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Sehir ismi
            Text(_havadurumu?.sehirIsim ?? "Şehir yükleniyor..."),

            //Sicaklik
            Text("${_havadurumu?.sicaklik.round()}*C"),
          ],
        ),
      ),
    );
  }
}
