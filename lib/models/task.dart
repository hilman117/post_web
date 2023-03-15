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
      this.location,
      this.id,
      this.time,
      this.status,
      this.sendTo,
      this.isFading,
      this.emailSender,
      this.profileImageSender,
      this.positionSender,
      this.from});

  String? receiver;
  String? description;
  String? title;
  String? setDate;
  String? setTime;
  String? sender;
  String? emailSender;
  String? profileImageSender;
  String? positionSender;
  List<dynamic>? comment;
  List<String>? assigned;
  String? location;
  String? id;
  DateTime? time;
  String? status;
  bool? isFading;
  String? sendTo;
  String? from;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
      receiver: json["receiver"],
      description: json["description"],
      title: json["title"],
      emailSender: json["emailSender"],
      profileImageSender: json["profileImageSender"],
      positionSender: json["positionSender"],
      setDate: json["setDate"],
      setTime: json["setTime"],
      sender: json["sender"],
      comment: List<dynamic>.from(json["comment"].map((x) => x)),
      assigned: List<String>.from(json["assigned"].map((x) => x)),
      location: json["location"],
      id: json["id"],
      time: DateTime.parse(json["time"]),
      status: json["status"],
      sendTo: json["sendTo"],
      isFading: json["isFading"],
      from: json["from"]);

  Map<String, dynamic> toJson() => {
        "receiver": receiver,
        "emailSender": emailSender,
        "profileImageSender": profileImageSender,
        "positionSender": positionSender,
        "description": description,
        "title": title,
        "setDate": setDate,
        "setTime": setTime,
        "sender": sender,
        "from": from,
        "comment":
            comment == null ? [] : List<dynamic>.from(comment!.map((x) => x)),
        "assigned": assigned == null
            ? null
            : List<dynamic>.from(assigned!.map((x) => x)),
        "location": location,
        "id": id,
        "time": time!.toIso8601String(),
        "status": status,
        "isFading": isFading,
        "sendTo": sendTo,
      };
}
