class AdsEntity {
  String title;
  String description;
  double lot;
  double lat;

  AdsEntity(
      {required this.title,
      required this.description,
      required this.lot,
      required this.lat});

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "lot": lot,
    "lat": lat,
  };
}
