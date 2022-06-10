// To parse this JSON data, do
//
//     final credential = credentialFromJson(jsonString);

import 'dart:convert';

Credential credentialFromJson(String str) =>
    Credential.fromJson(json.decode(str));

String credentialToJson(Credential data) => json.encode(data.toJson());

class Credential {
  Credential({
    this.email,
    this.name,
    this.newIc,
  });

  String? email;
  String? name;
  String? newIc;

  factory Credential.fromJson(Map<String, dynamic> json) => Credential(
        email: json["email"],
        name: json["name"],
        newIc: json["new_ic"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "new_ic": newIc,
      };
}
