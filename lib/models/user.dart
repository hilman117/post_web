class UserDetails {
  String? email;
  String? name;
  String? position;
  String? hotel;
  String? location;
  String? profileImage;
  String? department;
  String? uid;
  bool? hasImage;
  String? hotelid;

  UserDetails(
      {this.email,
      this.uid,
      this.hotelid,
      this.name,
      this.position,
      this.hotel,
      this.location,
      this.profileImage,
      this.department,
      this.hasImage});

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        email: json['email'],
        name: json['name'],
        hotelid: json['hotelid'],
        uid: json['uid'],
        position: json['position'],
        hotel: json['hotel'],
        location: json['location'],
        profileImage: json['profileImage'],
        department: json['department'],
        hasImage: json['hasImage'],
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'hotelid': hotelid,
        'uid': uid,
        'position': position,
        'hotel': hotel,
        'location': location,
        'profileImage': profileImage,
        'department': department,
        'hasImage': hasImage,
      };
}
