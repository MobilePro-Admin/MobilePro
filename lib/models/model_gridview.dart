class ModelGridview {
  final int id;
  final String name;
  final String image;
  final String description;

  const ModelGridview({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  factory ModelGridview.fromJson(Map<String, dynamic> json) => ModelGridview(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      description: json["description"]);

  Map<String, dynamic> tojson() => {
    "id": id,
    "name": name,
    "image": image,
    "description": description,
  };

  ModelGridview copy() => ModelGridview(
    id: id,
    name: name,
    image: image,
    description: description,
  );
}
