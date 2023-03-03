class GeneralData {
  GeneralData({
    this.hotelName,
    this.hotelid,
    this.domain,
    this.location,
    this.admin,
  });

  String? hotelName;
  String? hotelid;
  String? domain;
  List<dynamic>? admin;
  List<dynamic>? location;

  factory GeneralData.fromJson(Map<String, dynamic> json) => GeneralData(
        hotelName: json["hotelName"],
        hotelid: json["hotelid"],
        domain: json["domain"],
        admin: List<dynamic>.from(json["admin"].map((x) => x)),
        location: List<dynamic>.from(json["location"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "hotelName": hotelName,
        "hotelid": hotelid,
        "domain": domain,
        "admin": admin == null ? [] : List<dynamic>.from(admin!.map((x) => x)),
        "location":
            location == null ? [] : List<dynamic>.from(location!.map((x) => x)),
      };
}
