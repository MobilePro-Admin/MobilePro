class ModelGridview {
  final int id;
  final String name;
  final String image;
  final String description;
  final double rating;

  const ModelGridview({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.rating,
  });

  factory ModelGridview.fromJson(Map<String, dynamic> json) => ModelGridview(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      description: json["description"],
      rating: json["rating"],
    );

  Map<String, dynamic> tojson() => {
    "id": id,
    "name": name,
    "image": image,
    "description": description,
    "rating": rating,
  };

  ModelGridview copy() => ModelGridview(
    id: id,
    name: name,
    image: image,
    description: description,
    rating: rating,
  );
}
