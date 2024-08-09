import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'offices.g.dart';

@JsonSerializable()
class OfficesList {
  final List<Offices> offices;
  final List<Regions> regions;

  const OfficesList({required this.offices, required this.regions});

  factory OfficesList.fromJson(Map<String, dynamic> json) =>
      _$OfficesListFromJson(json);

  Map<String, dynamic> toJson() => _$OfficesListToJson(this);
}

@JsonSerializable()
class Offices {
  final String address;
  final String id;
  final String image;
  final double lat;
  final double lng;
  final String name;
  final String phone;
  final String region;

  const Offices({
    required this.address,
    required this.id,
    required this.image,
    required this.lat,
    required this.lng,
    required this.name,
    required this.phone,
    required this.region,
  });

  factory Offices.fromJson(Map<String, dynamic> json) =>
      _$OfficesFromJson(json);

  Map<String, dynamic> toJson() => _$OfficesToJson(this);
}

@JsonSerializable()
class Regions {
  final Coords coords;
  final String id;
  final String name;
  final int zoom;

  const Regions({
    required this.coords,
    required this.id,
    required this.name,
    required this.zoom,
  });

  factory Regions.fromJson(Map<String, dynamic> json) =>
      _$RegionsFromJson(json);

  Map<String, dynamic> toJson() => _$RegionsToJson(this);
}

@JsonSerializable()
class Coords {
  final double lat;
  final double lng;

  const Coords({
    required this.lat,
    required this.lng,
  });

  factory Coords.fromJson(Map<String, dynamic> json) => _$CoordsFromJson(json);

  Map<String, dynamic> toJson() => _$CoordsToJson(this);
}

Future<OfficesList> getOfficesList() async {
  const url = 'https://about.google/static/data/locations.json';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return OfficesList.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load offices list');
  }
}
