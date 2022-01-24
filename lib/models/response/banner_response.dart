// To parse this JSON data, do
//
//     final bannerResponse = bannerResponseFromJson(jsonString);

import 'dart:convert';

BannerResponse bannerResponseFromJson(String str) =>
    BannerResponse.fromJson(json.decode(str));

String bannerResponseToJson(BannerResponse data) => json.encode(data.toJson());

class BannerResponse {
  BannerResponse({
    required this.results,
    required this.total,
  });

  List<Result> results;
  int total;

  factory BannerResponse.fromJson(Map<String, dynamic> json) => BannerResponse(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total": total,
      };
}

class Result {
  Result({
    required this.id,
    required this.name,
    this.description,
    required this.imageUrl,
    required this.link,
    required this.payload,
    required this.isActive,
    required this.isInApp,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String name;
  dynamic description;
  String imageUrl;
  String link;
  dynamic payload;
  bool isActive;
  bool isInApp;
  DateTime createdAt;
  DateTime updatedAt;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        link: json["link"],
        payload: json["payload"],
        isActive: json["isActive"],
        isInApp: json["isInApp"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "imageUrl": imageUrl,
        "link": link,
        "payload": payload,
        "isActive": isActive,
        "isInApp": isInApp,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
