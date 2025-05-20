class CategoriesModel {
  const CategoriesModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String name;
  final String slug;
  final String image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      slug: json["slug"] ?? "",
      image: json["image"] ?? "",
      createdAt: json["createdAt"] == null
          ? null
          : DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: json["updatedAt"] == null
          ? null
          : DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }
}
