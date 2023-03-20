class Departement {
  Departement(
      {this.departement,
      this.departementIcon,
      this.title,
      this.isActive,
      this.totalRequest});

  bool? isActive;
  String? departement;
  String? departementIcon;
  List<String>? title;
  int? totalRequest;

  factory Departement.fromJson(Map<String, dynamic> json) => Departement(
        departement: json["departement"],
        isActive: json["isActive"],
        totalRequest: json["totalRequest"],
        departementIcon: json["departementIcon"],
        title: List<String>.from(json["title"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "departement": departement,
        "isActive": isActive,
        "totalRequest": totalRequest,
        "departementIcon": departementIcon,
        "title": title == null ? [] : List<dynamic>.from(title!.map((x) => x)),
      };
}
