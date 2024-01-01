class HavaDurumu {
  final String sehirIsim;
  final double sicaklik;
  final String suankiDurum;

  HavaDurumu({
    required this.sehirIsim,
    required this.sicaklik,
    required this.suankiDurum,
  });

  factory HavaDurumu.fromJson(Map<String, dynamic> json) {
    return HavaDurumu(
      sehirIsim: json['name'],
      sicaklik: json['main']['temp'].toDouble(),
      suankiDurum: json['weather'][0]['main'],
    );
  }
}
