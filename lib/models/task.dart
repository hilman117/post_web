class TaskModel {
  TaskModel({
    this.isClose,
    this.image,
    this.taskModelImageProfile,
    this.receiver,
    this.unread,
    this.description,
    this.title,
    this.schedule,
    this.sender,
    this.imageProfile,
    this.comment,
    this.location,
    this.id,
    this.time,
    this.position,
    this.status,
    this.commentsender,this.sendTo, this.priority, this.from
  });

  bool? isClose;
  String? image;
  bool? taskModelImageProfile;
  bool? isDiscribed;
  String? receiver;
  String? priority;
  String? unread;
  String? description;
  bool? isUpdated;
  bool? isScheduled;
  String? title;
  bool? havePicture;
  String? schedule;
  String? sender;
  String? imageProfile;
  List<dynamic>? comment;
  String? location;
  String? id;
  DateTime? time;
  String? position;
  String? status;
  String? commentsender;
  String? sendTo;
  String? from;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        isClose: json["isClose"],
        image: json["image"],
        taskModelImageProfile: json["imageProfile?"],
        receiver: json["receiver"],
        unread: json["unread"],
        description: json["description"],
        title: json["title"],
        schedule: json["schedule"],
        sender: json["sender"],
        imageProfile: json["imageProfile"],
        comment: List<dynamic>.from(json["comment"].map((x) => x)),
        location: json["location"],
        id: json["id"],
        time: DateTime.parse(json["time"]),
        position: json["position"],
        status: json["status"],
        commentsender: json["commentsender"],
        sendTo: json["sendTo"],
        priority: json["priority"],
        from: json["from"]
      );

  Map<String, dynamic> toJson() => {
        "isClose": isClose,
        "image": image,
        "receiver": receiver,
        "unread": unread,
        "description": description,
        "title": title,
        "schedule": schedule,
        "sender": sender,
        "from": from,
        "imageProfile": imageProfile,
        "comment":
            comment == null ? null : List<dynamic>.from(comment!.map((x) => x)),
        "location": location,
        "id": id,
        "time": time!.toIso8601String(),
        "position": position,
        "status": status,
        "commentsender": commentsender,
        "sendTo": sendTo,
        "priority": priority,
      };
}
