class GeneralData {
  GeneralData(
      {this.hotelName,
      this.domain,
      this.location,
      this.admin,
      this.departement});

  String? hotelName;
  String? domain;
  List<dynamic>? admin;
  List<dynamic>? location;
  List<dynamic>? departement;

  factory GeneralData.fromJson(Map<String, dynamic> json) => GeneralData(
        hotelName: json["hotelName"],
        domain: json["domain"],
        admin: List<dynamic>.from(json["admin"].map((x) => x)),
        location: List<dynamic>.from(json["location"].map((x) => x)),
        departement: List<dynamic>.from(json["departement"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "hotelName": hotelName,
        "domain": domain,
        "admin": admin == null ? [] : List<dynamic>.from(admin!.map((x) => x)),
        "departement": departement == null
            ? []
            : List<dynamic>.from(departement!.map((x) => x)),
        "location":
            location == null ? [] : List<dynamic>.from(location!.map((x) => x)),
      };
}
