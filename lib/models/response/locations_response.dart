// To parse this JSON data, do
//
//     final locationsResponse = locationsResponseFromJson(jsonString);

import 'dart:convert';

LocationsResponse locationsResponseFromJson(String str) =>
    LocationsResponse.fromJson(json.decode(str));

String locationsResponseToJson(LocationsResponse data) =>
    json.encode(data.toJson());

class LocationsResponse {
  LocationsResponse({
    required this.results,
    required this.total,
  });

  List<Result> results;
  int total;

  factory LocationsResponse.fromJson(Map<String, dynamic> json) =>
      LocationsResponse(
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
    this.name,
    this.displayName,
    this.address,
    this.phoneContact,
    this.emailContact,
    this.businessId,
    required this.isActive,
    this.gallery,
    this.thumbnail,
    required this.createdAt,
    required this.updatedAt,
    this.coordinates,
    this.geoLocation,
    this.cityId,
    this.description,
    this.serviceReferenceIds,
    this.amenityIds,
    this.workingTime,
    this.policy,
    this.rating,
    this.minPrice,
    this.maxPrice,
    this.emailEnquiry,
    this.openDate,
    this.establishedAt,
    this.country,
    this.city,
    required this.totalReview,
    this.serviceInfor,
    required this.timeZone,
    this.business,
    required this.roomTypes,
  });

  String id;
  dynamic name;
  dynamic displayName;
  dynamic address;
  dynamic phoneContact;
  dynamic emailContact;
  dynamic businessId;
  bool isActive;
  dynamic gallery;
  dynamic thumbnail;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic coordinates;
  dynamic geoLocation;
  dynamic cityId;
  dynamic description;
  dynamic serviceReferenceIds;
  dynamic amenityIds;
  dynamic workingTime;
  dynamic policy;
  dynamic rating;
  dynamic minPrice;
  dynamic maxPrice;
  dynamic emailEnquiry;
  dynamic openDate;
  dynamic establishedAt;
  dynamic country;
  dynamic city;
  int totalReview;
  dynamic serviceInfor;
  int timeZone;
  dynamic business;
  List<dynamic> roomTypes;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        displayName: json["displayName"],
        address: json["address"],
        phoneContact: json["phoneContact"],
        emailContact: json["emailContact"],
        businessId: json["businessId"],
        isActive: json["isActive"],
        gallery: json["gallery"],
        thumbnail: json["thumbnail"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        coordinates: json["coordinates"],
        geoLocation: json["geoLocation"],
        cityId: json["cityId"],
        description: json["description"],
        serviceReferenceIds: json["serviceReferenceIds"],
        amenityIds: json["amenityIds"],
        workingTime: json["workingTime"],
        policy: json["policy"],
        rating: json["rating"],
        minPrice: json["minPrice"],
        maxPrice: json["maxPrice"],
        emailEnquiry: json["emailEnquiry"],
        openDate: json["openDate"],
        establishedAt: json["establishedAt"],
        country: json["country"],
        city: json["city"],
        totalReview: json["totalReview"],
        serviceInfor: json["serviceInfor"],
        timeZone: json["timeZone"],
        business: json["business"],
        roomTypes: List<dynamic>.from(json["roomTypes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "displayName": displayName,
        "address": address,
        "phoneContact": phoneContact,
        "emailContact": emailContact,
        "businessId": businessId,
        "isActive": isActive,
        "gallery": gallery,
        "thumbnail": thumbnail,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "coordinates": coordinates,
        "geoLocation": geoLocation,
        "cityId": cityId,
        "description": description,
        "serviceReferenceIds": serviceReferenceIds,
        "amenityIds": amenityIds,
        "workingTime": workingTime,
        "policy": policy,
        "rating": rating,
        "minPrice": minPrice,
        "maxPrice": maxPrice,
        "emailEnquiry": emailEnquiry,
        "openDate": openDate,
        "establishedAt": establishedAt,
        "country": country,
        "city": city,
        "totalReview": totalReview,
        "serviceInfor": serviceInfor,
        "timeZone": timeZone,
        "business": business,
        "roomTypes": List<dynamic>.from(roomTypes.map((x) => x)),
      };
}
