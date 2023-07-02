class User {
  String? username;
  String? email;
  String? password;
  int? followers;
  double? valorationProm;

  User(
      {this.username,
      this.email,
      this.password,
      this.followers,
      this.valorationProm});

  User.fromJson(Map<String, dynamic> json)
      : username = json["username"],
        email = json["email"],
        password = json["password"],
        followers = json["followers"],
        valorationProm = json["valorationProm"];

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["username"] = username;
    json["email"] = email;
    json["password"] = password;
    json["followers"] = followers;
    json["valorationProm"] = valorationProm;
    return json;
  }
}
