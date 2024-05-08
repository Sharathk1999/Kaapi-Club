class UserModel {
  String? id;
  String? name;
  String? email;
  String? profileImg;
  String? mobileNumber;
  String? bio;
  String? createdAt;
  String? lastSeenOnline;
  String? status;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.profileImg,
    this.mobileNumber,
    this.bio,
    this.createdAt,
    this.lastSeenOnline,
    this.status,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    profileImg = json["profileImg"];
    mobileNumber = json["mobileNumber"];
    bio = json["bio"];
    createdAt = json["createdAt"];
    lastSeenOnline = json["lastSeenOnline"];
    status = json["status"];
  }

  Map<String, dynamic> toJson() {
    // ignore: no_leading_underscores_for_local_identifiers
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["profileImg"] = profileImg;
    _data["mobileNumber"] = mobileNumber;
    _data["bio"] = bio;
    _data["createdAt"] = createdAt;
    _data["lastSeenOnline"] = lastSeenOnline;
    _data["status"] = status;
    return _data;
  }
}
