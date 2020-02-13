class FoodModels {
  final int id;
  final String name, thumbnail;
  final List<dynamic> materials, seasonings, howTo;

  FoodModels(
      {this.id,
      this.name,
      this.thumbnail,
      this.materials,
      this.seasonings,
      this.howTo});

  FoodModels.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        thumbnail = json["thumbnail"],
        materials = json["materials"],
        seasonings = json["seasonings"],
        howTo = json["howto"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "thumbnail": thumbnail,
        "materials": materials,
        "seasonings": seasonings,
        "howto": howTo
      };
}
