import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class QRCodeScan {

  static const String url = 'url';
  static const String geolocation = 'location';

  int? id;
  String? type;
  String value;

  QRCodeScan({
    this.id,
    this.type,
    required this.value,
  }) {
    type = value.contains('http') ? url : geolocation;
  }

  LatLng get latLng {
    final List<String> latLng = value.substring(4).split(',');
    return LatLng(double.parse(latLng[0]), double.parse(latLng[1]));
  }

  factory QRCodeScan.fromJson(Map<String, dynamic> json) => QRCodeScan(
    id: json["id"],
    type: json["type"],
    value: json["value"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "value": value
  };

  @override
  String toString() {
    return '$id - $type - $value';
  }

}