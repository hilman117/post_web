class GeneralData {
  GeneralData({
    this.hotelName,
    this.hotelid,
    this.domain,
    this.hotelImage,
    this.location,
    this.admin,
    this.deptToStoreLF,
    this.titles,
  });

  String? hotelName;
  String? hotelid;
  String? hotelImage;
  String? domain;
  String? deptToStoreLF;
  List<dynamic>? admin;
  List<dynamic>? titles;
  List<String>? location;

  factory GeneralData.fromJson(Map<String, dynamic> json) => GeneralData(
        hotelName: json["hotelName"],
        hotelid: json["hotelid"],
        deptToStoreLF: json["deptToStoreLF"],
        domain: json["domain"],
        hotelImage: json["hotelImage"],
        admin: List<dynamic>.from(json["admin"].map((x) => x)),
        titles: List<dynamic>.from(json["titles"].map((x) => x)),
        location: List<String>.from(json["location"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "hotelName": hotelName,
        "hotelid": hotelid,
        "hotelImage": hotelImage,
        "deptToStoreLF": deptToStoreLF,
        "domain": domain,
        "admin": admin == null ? [] : List<dynamic>.from(admin!.map((x) => x)),
        "titles":
            titles == null ? [] : List<dynamic>.from(titles!.map((x) => x)),
        "location":
            location == null ? [] : List<String>.from(location!.map((x) => x)),
      };
}
