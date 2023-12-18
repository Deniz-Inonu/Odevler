import 'package:flutter/material.dart';
import 'package:vize_odev/pages/kaydet.dart';

class EklePage extends StatefulWidget {
  const EklePage({Key? key}) : super(key: key);

  @override
  State<EklePage> createState() => _EklePageState();
}

class _EklePageState extends State<EklePage> {
//Kontrol
  final _kitapadiController = TextEditingController();
  final _yayineviController = TextEditingController();
  final _yazarlarController = TextEditingController();
  final _sayfaSayisiController = TextEditingController();
  final _basimyiliController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        content: Container(
            child: SingleChildScrollView(
          child: Column(
            children: [
              //top

              //Geri dön
              const Icon(
                Icons.keyboard_return,
                size: 20,
              ),

              const Text(
                "Kitap Ekle",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),

              //kitap adi
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _kitapadiController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Kitap Adi',
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),

              //yayin evi
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _yayineviController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Yayin evi',
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),

//yazarlar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _yazarlarController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Yazarlar',
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),

//Kategori alanı seçilebilir bir alan olup içeriğinde
// Roman, Tarih, Edebiyat, Şiir, Ansiklopedi

//Sayfa sayisi -integer
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _sayfaSayisiController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Sayfa sayisi',
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),

//Basim yili   - integer
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _basimyiliController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Basim yili',
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),

// listede yayınlanacak mi?  -boolean  true/false
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    child: Row(
                      children: [
                        // heckco
                      ],
                    ),
                  )),

// kaydet
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  child: Kaydet(text: "Kaydet", onPressed: () {}),
                ),
              ),
            ],
          ),
        )));
  }
}
