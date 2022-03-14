// To parse this JSON data, do
//
//     final locationResponse = locationResponseFromJson(jsonString);

import 'dart:convert';

LocationResponse locationResponseFromJson(String str) =>
    LocationResponse.fromJson(json.decode(str));

String locationResponseToJson(LocationResponse data) =>
    json.encode(data.toJson());

class LocationResponse {
  static obs() {}
  LocationResponse({
    required this.id,
    required this.name,
    this.displayName,
    required this.address,
    required this.phoneContact,
    required this.emailContact,
    required this.businessId,
    required this.isActive,
    this.gallery,
    this.thumbnail,
    required this.createdAt,
    required this.updatedAt,
    required this.coordinates,
    required this.geoLocation,
    this.cityId,
    this.description,
    required this.serviceReferenceIds,
    required this.amenityIds,
    required this.workingTime,
    this.policy,
    required this.rating,
    this.placeDetail,
    this.placeId,
    required this.minPrice,
    required this.maxPrice,
    required this.emailEnquiry,
    this.openDate,
    this.establishedAt,
    this.country,
    this.city,
    required this.totalReview,
    this.serviceInfor,
    required this.timeZone,
    required this.business,
    required this.roomTypes,
    required this.isFavorite,
    required this.displayOpenTime,
    required this.packageTypes,
  });

  String id;
  String name;
  dynamic displayName;
  String address;
  String phoneContact;
  String emailContact;
  String businessId;
  bool isActive;
  dynamic gallery;
  dynamic thumbnail;
  DateTime createdAt;
  DateTime updatedAt;
  Coordinates coordinates;
  String geoLocation;
  dynamic cityId;
  dynamic description;
  dynamic serviceReferenceIds;
  List<dynamic> amenityIds;
  WorkingTime workingTime;
  dynamic policy;
  dynamic rating;
  dynamic placeDetail;
  dynamic placeId;
  dynamic minPrice;
  dynamic maxPrice;
  String emailEnquiry;
  dynamic openDate;
  dynamic establishedAt;
  dynamic country;
  dynamic city;
  String totalReview;
  dynamic serviceInfor;
  int timeZone;
  Business business;
  List<RoomType> roomTypes;
  bool isFavorite;
  List<String> displayOpenTime;
  List<dynamic> packageTypes;

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      LocationResponse(
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
        coordinates: Coordinates.fromJson(json["coordinates"]),
        geoLocation: json["geoLocation"],
        cityId: json["cityId"],
        description: json["description"],
        serviceReferenceIds: json["serviceReferenceIds"],
        amenityIds: List<dynamic>.from(json["amenityIds"].map((x) => x)),
        workingTime: WorkingTime.fromJson(json["workingTime"]),
        policy: json["policy"],
        rating: json["rating"],
        placeDetail: json["placeDetail"],
        placeId: json["placeId"],
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
        business: Business.fromJson(json["business"]),
        roomTypes: List<RoomType>.from(
            json["roomTypes"].map((x) => RoomType.fromJson(x))),
        isFavorite: json["isFavorite"],
        displayOpenTime:
            List<String>.from(json["displayOpenTime"].map((x) => x)),
        packageTypes: List<dynamic>.from(json["packageTypes"].map((x) => x)),
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
        "coordinates": coordinates.toJson(),
        "geoLocation": geoLocation,
        "cityId": cityId,
        "description": description,
        "serviceReferenceIds":
            List<dynamic>.from(serviceReferenceIds.map((x) => x)),
        "amenityIds": List<dynamic>.from(amenityIds.map((x) => x)),
        "workingTime": workingTime.toJson(),
        "policy": policy,
        "rating": rating,
        "placeDetail": placeDetail,
        "placeId": placeId,
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
        "business": business.toJson(),
        "roomTypes": List<dynamic>.from(roomTypes.map((x) => x.toJson())),
        "isFavorite": isFavorite,
        "displayOpenTime": List<dynamic>.from(displayOpenTime.map((x) => x)),
        "packageTypes": List<dynamic>.from(packageTypes.map((x) => x)),
      };
}

class Business {
  Business({
    required this.isPayingClient,
    required this.id,
  });

  bool isPayingClient;
  String id;

  factory Business.fromJson(Map<String, dynamic> json) => Business(
        isPayingClient: json["isPayingClient"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "isPayingClient": isPayingClient,
        "id": id,
      };
}

class Coordinates {
  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  double latitude;
  double longitude;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class RoomType {
  RoomType({
    required this.id,
    required this.name,
    required this.isActive,
    this.image,
    required this.businessId,
    required this.locationId,
    required this.createdAt,
    required this.updatedAt,
    required this.displayName,
    this.minPrice,
    this.maxPrice,
    required this.description,
    required this.serviceReferenceId,
    required this.currency,
    this.code,
    required this.serviceReference,
    required this.gallery,
    required this.serviceGroupId,
  });

  String id;
  String name;
  bool isActive;
  dynamic image;
  dynamic businessId;
  String locationId;
  DateTime createdAt;
  DateTime updatedAt;
  DisplayName displayName;
  dynamic minPrice;
  dynamic maxPrice;
  dynamic description;
  String serviceReferenceId;
  String currency;
  dynamic code;
  ServiceReference serviceReference;
  dynamic gallery;
  String serviceGroupId;

  factory RoomType.fromJson(Map<String, dynamic> json) => RoomType(
        id: json["id"],
        name: json["name"],
        isActive: json["isActive"],
        image: json["image"],
        businessId: json["businessId"],
        locationId: json["locationId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        displayName: DisplayName.fromJson(json["displayName"]),
        minPrice: json["minPrice"],
        maxPrice: json["maxPrice"],
        description: json["description"],
        serviceReferenceId: json["serviceReferenceId"],
        currency: json["currency"],
        code: json["code"],
        serviceReference: ServiceReference.fromJson(json["serviceReference"]),
        gallery: json["gallery"],
        serviceGroupId: json["serviceGroupId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isActive": isActive,
        "image": image,
        "businessId": businessId,
        "locationId": locationId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "displayName": displayName.toJson(),
        "minPrice": minPrice,
        "maxPrice": maxPrice,
        "description": description,
        "serviceReferenceId": serviceReferenceId,
        "currency": currency,
        "code": code,
        "serviceReference": serviceReference.toJson(),
        "gallery": List<dynamic>.from(gallery.map((x) => x)),
        "serviceGroupId": serviceGroupId,
      };
}

class DisplayName {
  DisplayName({
    required this.en,
    required this.vi,
  });

  String en;
  String vi;

  factory DisplayName.fromJson(Map<String, dynamic> json) => DisplayName(
        en: json["en"],
        vi: json["vi"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "vi": vi,
      };
}

class ServiceReference {
  ServiceReference({
    required this.id,
    required this.serviceGroup,
    required this.priority,
    required this.serviceGroupId,
  });

  String id;
  String serviceGroup;
  int priority;
  String serviceGroupId;

  factory ServiceReference.fromJson(Map<String, dynamic> json) =>
      ServiceReference(
        id: json["id"],
        serviceGroup: json["serviceGroup"],
        priority: json["priority"],
        serviceGroupId: json["serviceGroupId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "serviceGroup": serviceGroup,
        "priority": priority,
        "serviceGroupId": serviceGroupId,
      };
}

class WorkingTime {
  WorkingTime({
    required this.friday,
    required this.monday,
    required this.sunday,
    required this.tuesday,
    required this.saturday,
    required this.thursday,
    required this.wednesday,
  });

  Day friday;
  Day monday;
  Day sunday;
  Day tuesday;
  Day saturday;
  Day thursday;
  Day wednesday;

  factory WorkingTime.fromJson(Map<String, dynamic> json) => WorkingTime(
        friday: Day.fromJson(json["friday"]),
        monday: Day.fromJson(json["monday"]),
        sunday: Day.fromJson(json["sunday"]),
        tuesday: Day.fromJson(json["tuesday"]),
        saturday: Day.fromJson(json["saturday"]),
        thursday: Day.fromJson(json["thursday"]),
        wednesday: Day.fromJson(json["wednesday"]),
      );

  Map<String, dynamic> toJson() => {
        "friday": friday.toJson(),
        "monday": monday.toJson(),
        "sunday": sunday.toJson(),
        "tuesday": tuesday.toJson(),
        "saturday": saturday.toJson(),
        "thursday": thursday.toJson(),
        "wednesday": wednesday.toJson(),
      };
}

class Day {
  Day({
    required this.isOpen,
    required this.openTime,
    required this.closeTime,
  });

  bool isOpen;
  dynamic openTime;
  dynamic closeTime;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        isOpen: json["isOpen"],
        openTime: json["openTime"],
        closeTime: json["closeTime"],
      );

  Map<String, dynamic> toJson() => {
        "isOpen": isOpen,
        "openTime": openTime,
        "closeTime": closeTime,
      };
}
