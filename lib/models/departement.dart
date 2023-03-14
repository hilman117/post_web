class Departement {
  Departement(
      {this.departement, this.departementIcon, this.title, this.isActive});

  bool? isActive;
  String? departement;
  String? departementIcon;
  List<String>? title;

  factory Departement.fromJson(Map<String, dynamic> json) => Departement(
        departement: json["departement"],
        isActive: json["isActive"],
        departementIcon: json["departementIcon"],
        title: List<String>.from(json["title"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "departement": departement,
        "isActive": isActive,
        "departementIcon": departementIcon,
        "title": title == null ? [] : List<dynamic>.from(title!.map((x) => x)),
      };
}
