// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfficesList _$OfficesListFromJson(Map<String, dynamic> json) => OfficesList(
      offices: (json['offices'] as List<dynamic>)
          .map((e) => Offices.fromJson(e as Map<String, dynamic>))
          .toList(),
      regions: (json['regions'] as List<dynamic>)
          .map((e) => Regions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OfficesListToJson(OfficesList instance) =>
    <String, dynamic>{
      'offices': instance.offices,
      'regions': instance.regions,
    };

Offices _$OfficesFromJson(Map<String, dynamic> json) => Offices(
      address: json['address'] as String,
      id: json['id'] as String,
      image: json['image'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      name: json['name'] as String,
      phone: json['phone'] as String,
      region: json['region'] as String,
    );

Map<String, dynamic> _$OfficesToJson(Offices instance) => <String, dynamic>{
      'address': instance.address,
      'id': instance.id,
      'image': instance.image,
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
      'phone': instance.phone,
      'region': instance.region,
    };

Regions _$RegionsFromJson(Map<String, dynamic> json) => Regions(
      coords: Coords.fromJson(json['coords'] as Map<String, dynamic>),
      id: json['id'] as String,
      name: json['name'] as String,
      zoom: (json['zoom'] as num).toInt(),
    );

Map<String, dynamic> _$RegionsToJson(Regions instance) => <String, dynamic>{
      'coords': instance.coords,
      'id': instance.id,
      'name': instance.name,
      'zoom': instance.zoom,
    };

Coords _$CoordsFromJson(Map<String, dynamic> json) => Coords(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordsToJson(Coords instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
