// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Harita ',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

//controller
class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  Set<Marker> _markers = Set<Marker>();
  Set<Polygon> _polygons = Set<Polygon>();

  List<LatLng> polygonLatLngs = <LatLng>[];

  int _polygonIdCounter = 1;

// baslama noktasi -Muhendislik fakultesi
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(38.330171000000000, 38.447738000000000),
    zoom: 17.8846,
  );

  @override
  void initState() {
    super.initState();

    _setMarker(LatLng(38.330171000000000, 38.447738000000000));
  }

  void _setMarker(LatLng point) {
    setState(() {
      _markers.add(
        Marker(markerId: MarkerId('marker'), position: point),
      );
    });
  }

  void _setPolygon() {
    final String polygonIdVal = 'polygon_$_polygonIdCounter';
    _polygonIdCounter++;

    _polygons.add(
      Polygon(
        polygonId: PolygonId(polygonIdVal),
        points: polygonLatLngs,
        strokeWidth: 2,
        fillColor: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Harita'),
        backgroundColor: const Color.fromARGB(255, 177, 98, 190),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        markers: _markers,
        polygons: _polygons,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap: (point) {
          setState(() {
            polygonLatLngs.add(point);
            _setPolygon();
          });
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  var damageLevel;
                  return AlertDialog(
                    title: Text('Bina durumunu girin'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Bina ismi',
                          ),
                          onChanged: (value) {
                            var buildingName = value;
                          },
                        ),
                        DropdownButton<String>(
                          value: damageLevel,
                          hint: Text('Hasar Durumu'),
                          items: [
                            DropdownMenuItem(
                              child: Text("Agir Hasarli"),
                              value: "Agir Hasarli",
                            ),
                            DropdownMenuItem(
                              child: Text("Orta Hasarli"),
                              value: 'Orta Hasarli',
                            ),
                            DropdownMenuItem(
                              child: Text("Hafif Hasarli"),
                              value: 'Hafif Hasarli',
                            ),
                          ],
                          onChanged: (value) {
                            //   damageLevel değişkeni
                            setState(() {
                              damageLevel = value;
                            });
                          },
                        ),
                      ],
                    ),
                    actions: [
                      // Kaydet butonunu
                      TextButton(
                        child: Text('Kaydet'),
                        onPressed: () {
                          //Kapat
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Icon(Icons.apartment), //bina iconu
          ),
        ],
      ),
    );
  }
}
