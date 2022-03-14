// To parse this JSON data, do
//
//     final bookingsResponse = bookingsResponseFromJson(jsonString);

import 'dart:convert';

BookingsResponse bookingsResponseFromJson(String str) =>
    BookingsResponse.fromJson(json.decode(str));

String bookingsResponseToJson(BookingsResponse data) =>
    json.encode(data.toJson());

class BookingsResponse {
  BookingsResponse({
    required this.results,
    required this.total,
  });

  List<Result> results;
  int total;

  factory BookingsResponse.fromJson(Map<String, dynamic> json) =>
      BookingsResponse(
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
    required this.customerName,
    required this.customerEmail,
    this.customerGender,
    required this.customerId,
    this.note,
    required this.roomId,
    required this.packageId,
    required this.packageData,
    required this.startTime,
    required this.endTime,
    required this.isOnlineBooking,
    required this.status,
    required this.estimatedAmount,
    this.repeatedBy,
    required this.paymentStatus,
    this.repeatedAt,
    required this.businessId,
    required this.locationId,
    required this.code,
    required this.discountValue,
    this.discountUnit,
    required this.actualAmount,
    required this.createdAt,
    required this.updatedAt,
    required this.numberOfPeople,
    required this.isTeam,
    required this.creatorId,
    required this.serviceReference,
    required this.isGroup,
    this.promotionCode,
    this.promotionValue,
    required this.customerInfo,
    required this.capacityNumber,
    this.paymentId,
    required this.platform,
    required this.customerPhone,
    this.paymentPeriod,
    required this.extraServices,
    required this.location,
  });

  String id;
  String customerName;
  String customerEmail;
  dynamic customerGender;
  String customerId;
  dynamic note;
  String roomId;
  String packageId;
  PackageData packageData;
  DateTime startTime;
  DateTime endTime;
  bool isOnlineBooking;
  String status;
  int estimatedAmount;
  dynamic repeatedBy;
  String paymentStatus;
  dynamic repeatedAt;
  String businessId;
  String locationId;
  String code;
  dynamic discountValue;
  dynamic discountUnit;
  int actualAmount;
  DateTime createdAt;
  DateTime updatedAt;
  int numberOfPeople;
  bool isTeam;
  String creatorId;
  ServiceReference serviceReference;
  bool isGroup;
  dynamic promotionCode;
  dynamic promotionValue;
  CustomerInfo customerInfo;
  int capacityNumber;
  dynamic paymentId;
  String platform;
  dynamic customerPhone;
  dynamic paymentPeriod;
  dynamic extraServices;
  Location location;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        customerName: json["customerName"],
        customerEmail: json["customerEmail"],
        customerGender: json["customerGender"],
        customerId: json["customerId"],
        note: json["note"],
        roomId: json["roomId"],
        packageId: json["packageId"],
        packageData: PackageData.fromJson(json["packageData"]),
        startTime: DateTime.parse(json["startTime"]),
        endTime: DateTime.parse(json["endTime"]),
        isOnlineBooking: json["isOnlineBooking"],
        status: json["status"],
        estimatedAmount: json["estimatedAmount"],
        repeatedBy: json["repeatedBy"],
        paymentStatus: json["paymentStatus"],
        repeatedAt: json["repeatedAt"],
        businessId: json["businessId"],
        locationId: json["locationId"],
        code: json["code"],
        discountValue: json["discountValue"],
        discountUnit: json["discountUnit"],
        actualAmount: json["actualAmount"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        numberOfPeople: json["numberOfPeople"],
        isTeam: json["isTeam"],
        creatorId: json["creatorId"],
        serviceReference: ServiceReference.fromJson(json["serviceReference"]),
        isGroup: json["isGroup"],
        promotionCode: json["promotionCode"],
        promotionValue: json["promotionValue"],
        customerInfo: CustomerInfo.fromJson(json["customerInfo"]),
        capacityNumber: json["capacityNumber"],
        paymentId: json["paymentId"],
        platform: json["platform"],
        customerPhone: json["customerPhone"],
        paymentPeriod: json["paymentPeriod"],
        extraServices: json["extraServices"],
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customerName": customerName,
        "customerEmail": customerEmail,
        "customerGender": customerGender,
        "customerId": customerId,
        "note": note,
        "roomId": roomId,
        "packageId": packageId,
        "packageData": packageData.toJson(),
        "startTime": startTime.toIso8601String(),
        "endTime": endTime.toIso8601String(),
        "isOnlineBooking": isOnlineBooking,
        "status": status,
        "estimatedAmount": estimatedAmount,
        "repeatedBy": repeatedBy,
        "paymentStatus": paymentStatus,
        "repeatedAt": repeatedAt,
        "businessId": businessId,
        "locationId": locationId,
        "code": code,
        "discountValue": discountValue,
        "discountUnit": discountUnit,
        "actualAmount": actualAmount,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "numberOfPeople": numberOfPeople,
        "isTeam": isTeam,
        "creatorId": creatorId,
        "serviceReference": serviceReference.toJson(),
        "isGroup": isGroup,
        "promotionCode": promotionCode,
        "promotionValue": promotionValue,
        "customerInfo": customerInfo.toJson(),
        "capacityNumber": capacityNumber,
        "paymentId": paymentId,
        "platform": platform,
        "customerPhone": customerPhone,
        "paymentPeriod": paymentPeriod,
        "extraServices": List<dynamic>.from(extraServices.map((x) => x)),
        "location": location.toJson(),
      };
}

class CustomerInfo {
  CustomerInfo({
    required this.phoneNumber,
    required this.customerName,
    required this.customerEmail,
  });

  dynamic phoneNumber;
  String customerName;
  String customerEmail;

  factory CustomerInfo.fromJson(Map<String, dynamic> json) => CustomerInfo(
        phoneNumber: json["phoneNumber"],
        customerName: json["customerName"],
        customerEmail: json["customerEmail"],
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "customerName": customerName,
        "customerEmail": customerEmail,
      };
}

class Location {
  Location({
    required this.name,
    required this.address,
    required this.emailContact,
    required this.phoneContact,
    required this.thumbnail,
    required this.rating,
    required this.workingTime,
    required this.packageTypes,
    required this.roomTypes,
  });

  String name;
  String address;
  String emailContact;
  String phoneContact;
  String thumbnail;
  double rating;
  WorkingTime workingTime;
  List<PackageType> packageTypes;
  List<RoomType> roomTypes;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        address: json["address"],
        emailContact: json["emailContact"],
        phoneContact: json["phoneContact"],
        thumbnail: json["thumbnail"],
        rating: json["rating"].toDouble(),
        workingTime: WorkingTime.fromJson(json["workingTime"]),
        packageTypes: List<PackageType>.from(
            json["packageTypes"].map((x) => PackageType.fromJson(x))),
        roomTypes: List<RoomType>.from(
            json["roomTypes"].map((x) => RoomType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "emailContact": emailContact,
        "phoneContact": phoneContact,
        "thumbnail": thumbnail,
        "rating": rating,
        "workingTime": workingTime.toJson(),
        "packageTypes": List<dynamic>.from(packageTypes.map((x) => x.toJson())),
        "roomTypes": List<dynamic>.from(roomTypes.map((x) => x.toJson())),
      };
}

class PackageType {
  PackageType({
    required this.id,
    required this.name,
    required this.businessId,
    this.locationId,
    required this.isActive,
    required this.unit,
    required this.duration,
    required this.exceptDays,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
    required this.updatedAt,
    required this.displayName,
    required this.description,
  });

  String id;
  String name;
  String businessId;
  dynamic locationId;
  bool isActive;
  String unit;
  int duration;
  dynamic exceptDays;
  int startTime;
  int endTime;
  DateTime createdAt;
  DateTime updatedAt;
  DisplayName displayName;
  dynamic description;

  factory PackageType.fromJson(Map<String, dynamic> json) => PackageType(
        id: json["id"],
        name: json["name"],
        businessId: json["businessId"],
        locationId: json["locationId"],
        isActive: json["isActive"],
        unit: json["unit"],
        duration: json["duration"],
        exceptDays: json["exceptDays"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        displayName: DisplayName.fromJson(json["displayName"]),
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "businessId": businessId,
        "locationId": locationId,
        "isActive": isActive,
        "unit": unit,
        "duration": duration,
        "exceptDays": List<dynamic>.from(exceptDays.map((x) => x)),
        "startTime": startTime,
        "endTime": endTime,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "displayName": displayName.toJson(),
        "description": description == null ? null : description,
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

class RoomType {
  RoomType({
    required this.id,
    required this.name,
    required this.isActive,
    required this.image,
    required this.businessId,
    required this.locationId,
    required this.createdAt,
    required this.updatedAt,
    required this.displayName,
    required this.minPrice,
    required this.maxPrice,
    required this.description,
    required this.serviceReferenceId,
    required this.currency,
    this.code,
    this.serviceReference,
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
  dynamic serviceReference;
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
        serviceReference: json["serviceReference"],
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
        "description": description == null ? null : description,
        "serviceReferenceId": serviceReferenceId,
        "currency": currency,
        "code": code,
        "serviceReference": serviceReference,
        "gallery": List<dynamic>.from(gallery.map((x) => x)),
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
  int openTime;
  int closeTime;

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

class PackageData {
  PackageData({
    required this.id,
    required this.name,
    required this.unit,
    required this.amount,
    required this.roomId,
    required this.endTime,
    required this.isInApp,
    required this.duration,
    required this.isActive,
    required this.createdAt,
    required this.isVisible,
    required this.startTime,
    required this.updatedAt,
    required this.businessId,
    required this.exceptDays,
    required this.locationId,
    required this.roomTypeId,
    required this.searchText,
    this.description,
    required this.displayName,
    required this.packageType,
    required this.packageTypeId,
  });

  String id;
  String name;
  String unit;
  int amount;
  String roomId;
  int endTime;
  bool isInApp;
  int duration;
  bool isActive;
  DateTime createdAt;
  bool isVisible;
  int startTime;
  DateTime updatedAt;
  String businessId;
  List<int> exceptDays;
  String locationId;
  String roomTypeId;
  String searchText;
  dynamic description;
  DisplayName displayName;
  dynamic packageType;
  String packageTypeId;

  factory PackageData.fromJson(Map<String, dynamic> json) => PackageData(
        id: json["id"],
        name: json["name"],
        unit: json["unit"],
        amount: json["amount"],
        roomId: json["roomId"],
        endTime: json["endTime"],
        isInApp: json["isInApp"],
        duration: json["duration"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        isVisible: json["isVisible"],
        startTime: json["startTime"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        businessId: json["businessId"],
        exceptDays: List<int>.from(json["exceptDays"].map((x) => x)),
        locationId: json["locationId"],
        roomTypeId: json["roomTypeId"],
        searchText: json["searchText"],
        description: json["description"],
        displayName: DisplayName.fromJson(json["displayName"]),
        packageType: json["packageType"],
        packageTypeId: json["packageTypeId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "unit": unit,
        "amount": amount,
        "roomId": roomId,
        "endTime": endTime,
        "isInApp": isInApp,
        "duration": duration,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "isVisible": isVisible,
        "startTime": startTime,
        "updatedAt": updatedAt.toIso8601String(),
        "businessId": businessId,
        "exceptDays": List<dynamic>.from(exceptDays.map((x) => x)),
        "locationId": locationId,
        "roomTypeId": roomTypeId,
        "searchText": searchText,
        "description": description,
        "displayName": displayName.toJson(),
        "packageType": packageType,
        "packageTypeId": packageTypeId,
      };
}

class ServiceReference {
  ServiceReference({
    required this.id,
    required this.name,
    required this.isActive,
    required this.priority,
    this.colorCode,
    required this.createdAt,
    required this.updatedAt,
    this.description,
    required this.serviceGroupId,
  });

  String id;
  String name;
  bool isActive;
  int priority;
  dynamic colorCode;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic description;
  dynamic serviceGroupId;

  factory ServiceReference.fromJson(Map<String, dynamic> json) =>
      ServiceReference(
        id: json["id"],
        name: json["name"],
        isActive: json["isActive"],
        priority: json["priority"],
        colorCode: json["colorCode"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        description: json["description"],
        serviceGroupId: json["serviceGroupId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isActive": isActive,
        "priority": priority,
        "colorCode": colorCode,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "description": description,
        "serviceGroupId": serviceGroupId,
      };
}
