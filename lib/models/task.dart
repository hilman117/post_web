class TaskModel {
  TaskModel(
      {this.receiver,
      this.description,
      this.title,
      this.setDate,
      this.setTime,
      this.sender,
      this.comment,
      this.assigned,
      this.image,
      this.location,
      this.id,
      this.time,
      this.closeTime,
      this.status,
      this.sendTo,
      this.isFading,
      this.emailSender,
      this.profileImageSender,
      this.positionSender,
      this.resolusi,
      this.iconDepartement,
      this.typeReport,
      this.from});

  String? receiver;
  String? description;
  String? iconDepartement;
  String? title;
  String? setDate;
  String? setTime;
  String? sender;
  String? emailSender;
  String? profileImageSender;
  String? positionSender;
  List<dynamic>? comment;
  List<String>? assigned;
  List<String>? image;
  String? location;
  String? id;
  DateTime? time;
  String? closeTime;
  String? status;
  bool? isFading;
  String? sendTo;
  String? from;
  String? typeReport;
  String? resolusi;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
      receiver: json["receiver"],
      iconDepartement: json["iconDepartement"],
      resolusi: json["resolusi"],
      description: json["description"],
      title: json["title"],
      emailSender: json["emailSender"],
      profileImageSender: json["profileImageSender"],
      positionSender: json["positionSender"],
      setDate: json["setDate"],
      setTime: json["setTime"],
      sender: json["sender"],
      typeReport: json["typeReport"],
      comment: List<dynamic>.from(json["comment"].map((x) => x)),
      assigned: List<String>.from(json["assigned"].map((x) => x)),
      image: List<String>.from(json["image"].map((x) => x)),
      location: json["location"],
      id: json["id"],
      time: DateTime.parse(json["time"]),
      closeTime: json["closeTime"],
      status: json["status"],
      sendTo: json["sendTo"],
      isFading: json["isFading"],
      from: json["from"]);

  Map<String, dynamic> toJson() => {
        "receiver": receiver,
        "emailSender": emailSender,
        "typeReport": typeReport,
        "iconDepartement": iconDepartement,
        "profileImageSender": profileImageSender,
        "positionSender": positionSender,
        "description": description,
        "title": title,
        "setDate": setDate,
        "setTime": setTime,
        "sender": sender,
        "from": from,
        "resolusi": resolusi,
        "comment":
            comment == null ? [] : List<dynamic>.from(comment!.map((x) => x)),
        "assigned":
            assigned == null ? [] : List<dynamic>.from(assigned!.map((x) => x)),
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
        "location": location,
        "id": id,
        "time": time!.toIso8601String(),
        "closeTime": closeTime,
        "status": status,
        "isFading": isFading,
        "sendTo": sendTo,
      };
}
