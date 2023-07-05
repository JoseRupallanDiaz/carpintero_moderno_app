import 'package:el_carpintero_moderno_app/domain/entities/step.dart';

class Post {
  String? id;
  String title;
  double rating;
  List<String> materials;
  List<String> tools;
  int difficulty;
  String previewImage;
  String description;
  List<Step> steps;

  Post({
    this.title = "PlaceHolder Title",
    this.rating = 1.0,
    this.materials = const ["none"],
    this.tools = const ["none"],
    this.difficulty = 0,
    this.description = "No Description given",
    this.previewImage = "No image",
    this.steps = const [],
    this.id,
  });

  Post.fromJson(Map<String, dynamic> json)
      : id = json["_id"],
        title = json["title"],
        rating = json["rating"].toDouble(),
        tools = (json["tools"] as List).map((e) => e as String).toList(),
        materials =
            (json["materials"] as List).map((e) => e as String).toList(),
        difficulty = json["difficulty"],
        previewImage = json["previewImage"],
        description = json["description"] ?? "Not Description given",
        steps = Step.listFromJson(json["steps"] ?? []);

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
