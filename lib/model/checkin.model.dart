// To parse this JSON data, do
//
//     final checkin = checkinFromJson(jsonString);

import 'dart:convert';

List<Checkin> checkinFromJson(String str) =>
    List<Checkin>.from(json.decode(str).map((x) => Checkin.fromJson(x)));

String checkinToJson(List<Checkin> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Checkin {
  Checkin({
    this.locationName,
    this.checkin,
    this.createdAt,
  });

  String? locationName;
  bool? checkin;
  DateTime? createdAt;

  factory Checkin.fromJson(Map<String, dynamic> json) => Checkin(
        locationName: json["location_name"],
        checkin: json["checkin"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "location_name": locationName,
        "checkin": checkin,
        "created_at": createdAt?.toIso8601String(),
      };
}
