class Departement {
  Departement(
      {this.departement,
      this.departementIcon,
      this.title,
      this.isActive,
      this.color,
      this.totalRequest});

  bool? isActive;
  String? departement;
  String? departementIcon;
  List<String>? title;
  int? totalRequest;
  String? color;

  factory Departement.fromJson(Map<String, dynamic> json) => Departement(
        departement: json["departement"],
        color: json["color"],
        isActive: json["isActive"],
        totalRequest: json["totalRequest"],
        departementIcon: json["departementIcon"],
        title: List<String>.from(json["title"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "departement": departement,
        "color": color,
        "isActive": isActive,
        "totalRequest": totalRequest,
        "departementIcon": departementIcon,
        "title": title == null ? [] : List<dynamic>.from(title!.map((x) => x)),
      };
}
