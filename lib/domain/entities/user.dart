class User {
  String? username;
  String? email;
  String? password;
  int? followers;
  double? valorationProm;
  String? token;

  User({
    this.username,
    this.email,
    this.password,
    this.followers,
    this.valorationProm,
    this.token,
  });

  User.fromJson(Map<String, dynamic> json, String this.token)
      : username = json["userName"],
        email = json["email"],
        password = json["password"],
        followers = json["followers"],
        valorationProm = (json["valorationProm"] as int).toDouble();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> user = {};
    user["userName"] = username;
    user["email"] = email;
    user["password"] = password;
    user["followers"] = followers;
    user["valorationProm"] = valorationProm;
    return {
      "user": user,
      "token": token,
    };
  }
}
