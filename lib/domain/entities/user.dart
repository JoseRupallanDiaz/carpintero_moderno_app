class User {
  String? username;
  String? email;
  String? password;
  int? followers;
  int? posts;
  double? valorationProm;
  String? token;

  User(
      {this.username,
      this.email,
      this.password,
      this.followers,
      this.valorationProm,
      this.token,
      this.posts});

  User.fromJson(Map<String, dynamic> json, String this.token)
      : username = json["userName"],
        email = json["email"],
        password = json["password"],
        followers = json["followers"],
        posts = json["posts"],
        valorationProm = (json["valorationProm"]).toDouble();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> user = {};
    user["userName"] = username;
    user["email"] = email;
    user["password"] = password;
    user["followers"] = followers;
    user["posts"] = posts;
    user["valorationProm"] = valorationProm;
    return {
      "user": user,
      "token": token,
    };
  }
}
