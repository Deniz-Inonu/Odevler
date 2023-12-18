import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vize_odev/frbase/firestore.dart';

import 'kitap_ekle.dart';
import 'kitap_liste.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void Ekle() {
    showDialog(
      context: context,
      builder: (context) {
        return EklePage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Kütüphane yönetimi"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: Ekle,
          child: Icon(Icons.add),
        ),
        body: ListView(
          children: [
            Kitap_Liste(),
          ],
        ));
  }
}
