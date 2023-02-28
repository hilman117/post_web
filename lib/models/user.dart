class UserDetails {
  String? userColor;
  String? email;
  String? name;
  String? position;
  String? hotel;
  String? location;
  String? profileImage;
  String? department;
  String? uid;
  String? hotelid;
  String? accountType;
  bool? receiveNotifWhenAccepted;
  bool? receiveNotifWhenClose;
  bool? isOnDuty;
  int? acceptRequest;
  int? closeRequest;
  int? createRequest;

  UserDetails(
      {this.userColor,
      this.email,
      this.uid,
      this.hotelid,
      this.name,
      this.position,
      this.hotel,
      this.location,
      this.profileImage,
      this.department,
      this.receiveNotifWhenAccepted,
      this.receiveNotifWhenClose,
      this.acceptRequest,
      this.closeRequest,
      this.createRequest,
      this.isOnDuty,
      this.accountType});

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        userColor: json['userColor'],
        email: json['email'],
        name: json['name'],
        hotelid: json['hotelid'],
        uid: json['uid'],
        position: json['position'],
        hotel: json['hotel'],
        location: json['location'],
        profileImage: json['profileImage'],
        department: json['department'],
        receiveNotifWhenAccepted: json["ReceiveNotifWhenAccepted"],
        receiveNotifWhenClose: json["ReceiveNotifWhenClose"],
        acceptRequest: json["acceptRequest"],
        closeRequest: json["closeRequest"],
        createRequest: json["createRequest"],
        isOnDuty: json["isOnDuty"],
        accountType: json["accountType"],
      );

  Map<String, dynamic> toJson() => {
        'userColor': userColor,
        'email': email,
        'name': name,
        'hotelid': hotelid,
        'uid': uid,
        'position': position,
        'hotel': hotel,
        'location': location,
        'profileImage': profileImage,
        'ReceiveNotifWhenAccepted': receiveNotifWhenAccepted,
        'ReceiveNotifWhenClose': receiveNotifWhenClose,
        'acceptRequest': acceptRequest,
        'closeRequest': closeRequest,
        'createRequest': createRequest,
        'isOnDuty': isOnDuty,
        'department': department,
        'accountType': accountType,
      };
}
