import 'package:el_carpintero_moderno_app/domain/entities/step.dart';

class Post {
  String title;
  double rating;
  List<String> materials;
  List<String> tools;
  String difficulty;
  String previewImage;
  String description;
  List<Step> steps;

  Post(
      {this.title = "PlaceHolder Title",
      this.rating = 1.0,
      this.materials = const ["none"],
      this.tools = const ["none"],
      this.difficulty = "Fácil",
      this.description = "No Description given",
      this.previewImage = "No image",
      this.steps = const []});

  Post.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        rating = json["rating"],
        tools = json["tools"],
        materials = json["materials"],
        difficulty = json["difficulty"],
        previewImage = json["previewImage"],
        description = json["description"],
        steps = Step.listFromJson(json["steps"]);

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
