class Post {
  String? title;
  double? rating;
  List<String>? materials;
  List<String>? tools;
  int? difficulty;
  String? previewImage;
  String? description;
  List<String>? steps;

  Post.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        rating = json["rating"],
        tools = json["tools"],
        materials = json["materials"],
        difficulty = json["difficulty"],
        previewImage = json["previewImage"],
        description = json["description"],
        steps = json["steps"];

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["title"] = title;
    json["rating"] = rating;
    json["tools"] = tools;
    json["difficulty"] = difficulty;
    json["previewImage"] = previewImage;
    json["materials"] = materials;
    json["description"] = description;
    json["steps"] = steps;
    return json;
  }
}
