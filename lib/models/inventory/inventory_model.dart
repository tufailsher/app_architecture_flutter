class InventoryModel {
  bool? isError;
  String? msg;
  int? statuscode;
  Data? data;
  dynamic err;

  InventoryModel({
    this.isError,
    this.msg,
    this.statuscode,
    this.data,
    this.err,
  });

  factory InventoryModel.fromJson(Map<String, dynamic> json) => InventoryModel(
        isError: json["isError"],
        msg: json["msg"],
        statuscode: json["statuscode"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        err: json["err"],
      );

  Map<String, dynamic> toJson() => {
        "isError": isError,
        "msg": msg,
        "statuscode": statuscode,
        "data": data?.toJson(),
        "err": err,
      };
}

class Data {
  List<Datum>? data;
  int? count;
  int? page;
  int? rows;
  int? items;

  Data({
    this.data,
    this.count,
    this.page,
    this.rows,
    this.items,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        count: json["count"],
        page: json["page"],
        rows: json["rows"],
        items: json["items"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "count": count,
        "page": page,
        "rows": rows,
        "items": items,
      };
}

class Datum {
  DateTime? createdAt;
  DateTime? updatedAt;
  String? guid;
  bool? isActive;
  dynamic companyGuid;
  int? unitCount;
  String? itemEpc;
  String? itemType;
  String? serialNumber;
  String? lotNumber;
  DateTime? expirationDate;
  String? assetId;
  DateTime? manufactureDate;
  String? vendor;
  String? vendorNumber;
  String? status;
  String? department;
  DateTime? purchaseDate;
  dynamic lastCheckIn;
  String? productGuid;
  dynamic bizLocationGuid;
  dynamic packingEpc;
  dynamic bizLocation;
  List<dynamic>? movementEvent;

  Datum({
    this.createdAt,
    this.updatedAt,
    this.guid,
    this.isActive,
    this.companyGuid,
    this.unitCount,
    this.itemEpc,
    this.itemType,
    this.serialNumber,
    this.lotNumber,
    this.expirationDate,
    this.assetId,
    this.manufactureDate,
    this.vendor,
    this.vendorNumber,
    this.status,
    this.department,
    this.purchaseDate,
    this.lastCheckIn,
    this.productGuid,
    this.bizLocationGuid,
    this.packingEpc,
    this.bizLocation,
    this.movementEvent,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
      createdAt:
          json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
      updatedAt:
          json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      guid: json["GUID"],
      isActive: json["isActive"],
      companyGuid: json["companyGuid"],
      unitCount: json["unitCount"],
      itemEpc: json["itemEPC"],
      itemType: json["itemType"],
      serialNumber: json["serialNumber"],
      lotNumber: json["lotNumber"],
      expirationDate: json["expirationDate"] == null
          ? null
          : DateTime.parse(json["expirationDate"]),
      assetId: json["assetId"],
      manufactureDate: json["manufactureDate"] == null
          ? null
          : DateTime.parse(json["manufactureDate"]),
      vendor: json["vendor"],
      vendorNumber: json["vendorNumber"],
      status: json["status"],
      department: json["department"],
      purchaseDate: json["purchaseDate"] == null
          ? null
          : DateTime.parse(json["purchaseDate"]),
      lastCheckIn: json["lastCheckIn"],
      productGuid: json["productGuid"],
      bizLocationGuid: json["bizLocationGuid"],
      packingEpc: json["packingEPC"],
      bizLocation: json["bizLocation"],
      movementEvent: json["movementEvent"] == null
          ? null
          : List<dynamic>.from(json["movementEvent"].map((x) => x)));

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "GUID": guid,
        "isActive": isActive,
        "companyGuid": companyGuid,
        "unitCount": unitCount,
        "itemEPC": itemEpc,
        "itemType": itemType,
        "serialNumber": serialNumber,
        "lotNumber": lotNumber,
        "expirationDate": expirationDate?.toIso8601String(),
        "assetId": assetId,
        "manufactureDate": manufactureDate?.toIso8601String(),
        "vendor": vendor,
        "vendorNumber": vendorNumber,
        "status": status,
        "department": department,
        "purchaseDate": purchaseDate?.toIso8601String(),
        "lastCheckIn": lastCheckIn,
        "productGuid": productGuid,
        "bizLocationGuid": bizLocationGuid,
        "packingEPC": packingEpc,
        "bizLocation": bizLocation,
        "movementEvent": movementEvent,
      };
}
