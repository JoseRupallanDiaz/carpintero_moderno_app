class Step {
  String? body;
  String? image;

  Step({this.body, this.image});

  Step.fromJson(Map<String, dynamic> json)
      : body = json["body"],
        image = json["image"];

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["body"] = body;
    json["image"] = image;
    return json;
  }

  static List<Step> listFromJson(List<dynamic> json) {
    List<Step> steps = json.map((e) => Step.fromJson(e)).toList();
    return steps;
  }
}
