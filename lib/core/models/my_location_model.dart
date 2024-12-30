import 'dart:convert';

class MyLocation {
  double? longitude;
  double? latitude;
  String? country;
  String? city;

  MyLocation({
    this.longitude,
    this.latitude,
    this.country,
    this.city,
  });

  Map<String, dynamic> toMap() {
    return {
      'longitude': longitude,
      'latitude': latitude,
      'country': country,
      'city': city,
    };
  }

  factory MyLocation.fromMap(Map<String, dynamic> map) {
    return MyLocation(
      longitude: map['longitude'] as double?,
      latitude: map['latitude'] as double?,
      country: map['country'] as String?,
      city: map['city'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyLocation.fromJson(String source) =>
      MyLocation.fromMap(json.decode(source) as Map<String, dynamic>);
}
