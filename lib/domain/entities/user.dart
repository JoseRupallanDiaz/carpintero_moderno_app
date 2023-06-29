class User {
  String? username;
  String? fullname;
  String? password;
  int? followers;
  double? valorationProm;

  User(
      {this.username,
      this.fullname,
      this.password,
      this.followers,
      this.valorationProm});

  User.fromJson(Map<String, dynamic> json)
      : username = json["username"],
        fullname = json["fullname"],
        password = json["password"],
        followers = json["followers"],
        valorationProm = json["valorationProm"];

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["username"] = username;
    json["fullname"] = fullname;
    json["password"] = password;
    json["followers"] = followers;
    json["valorationProm"] = valorationProm;
    return json;
  }
}
