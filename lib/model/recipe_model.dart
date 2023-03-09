class RecipeModel {
  String? name;
  String? image;
  String? totalTime;
  int? rating;

  RecipeModel({
    required this.name,
    required this.image,
    required this.totalTime,
    required this.rating,
  });

  factory RecipeModel.formJson(Map<String, dynamic> json) {
    return RecipeModel(
      name: json["name"],
      image: json["images"][0]["hostedLargeUrl"] as String,
      totalTime: json["totalTime"] as String,
      rating: json["rating"],
    );
  }
}
