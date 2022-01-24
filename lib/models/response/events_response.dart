// To parse this JSON data, do
//
//     final eventsResponse = eventsResponseFromJson(jsonString);

import 'dart:convert';

EventsResponse eventsResponseFromJson(String str) =>
    EventsResponse.fromJson(json.decode(str));

String eventsResponseToJson(EventsResponse data) => json.encode(data.toJson());

class EventsResponse {
  EventsResponse({
    required this.results,
    required this.total,
  });

  List<Result> results;
  int total;

  factory EventsResponse.fromJson(Map<String, dynamic> json) => EventsResponse(
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
    required this.isActive,
    required this.thumbnail,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.eventTime,
    required this.content,
    this.businessId,
    this.priority,
    this.type,
    this.eventBy,
    this.eventCover,
    this.endTime,
    this.coordinates,
    this.geoLocation,
    this.address,
    this.eventLink,
    this.capacity,
    required this.isCharge,
    this.price,
    required this.totalConfirm,
    required this.status,
  });

  String id;
  String name;
  dynamic description;
  bool isActive;
  String thumbnail;
  String location;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime eventTime;
  String content;
  dynamic businessId;
  dynamic priority;
  dynamic type;
  dynamic eventBy;
  dynamic eventCover;
  dynamic endTime;
  dynamic coordinates;
  dynamic geoLocation;
  dynamic address;
  dynamic eventLink;
  dynamic capacity;
  bool isCharge;
  dynamic price;
  int totalConfirm;
  String status;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        isActive: json["isActive"],
        thumbnail: json["thumbnail"],
        location: json["location"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        eventTime: DateTime.parse(json["eventTime"]),
        content: json["content"],
        businessId: json["businessId"],
        priority: json["priority"],
        type: json["type"],
        eventBy: json["eventBy"],
        eventCover: json["eventCover"],
        endTime: json["endTime"],
        coordinates: json["coordinates"],
        geoLocation: json["geoLocation"],
        address: json["address"],
        eventLink: json["eventLink"],
        capacity: json["capacity"],
        isCharge: json["isCharge"],
        price: json["price"],
        totalConfirm: json["totalConfirm"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description == null ? null : description,
        "isActive": isActive,
        "thumbnail": thumbnail,
        "location": location,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "eventTime": eventTime.toIso8601String(),
        "content": content,
        "businessId": businessId,
        "priority": priority,
        "type": type,
        "eventBy": eventBy,
        "eventCover": eventCover,
        "endTime": endTime,
        "coordinates": coordinates,
        "geoLocation": geoLocation,
        "address": address,
        "eventLink": eventLink,
        "capacity": capacity,
        "isCharge": isCharge,
        "price": price,
        "totalConfirm": totalConfirm,
        "status": status,
      };
}
