import 'package:ecommerce/core/models/category_model.dart';
import 'package:ecommerce/core/models/metadata.dart';

class AllCategoriesResponse {
  const AllCategoriesResponse({
    required this.results,
    required this.metadata,
    required this.data,
  });

  final int results;
  final Metadata? metadata;
  final List<CategoriesModel> data;

  factory AllCategoriesResponse.fromJson(Map<String, dynamic> json) {
    return AllCategoriesResponse(
      results: json["results"] ?? 0,
      metadata:
          json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
      data: json["data"] == null
          ? []
          : List<CategoriesModel>.from(
              json["data"]!.map((x) => CategoriesModel.fromJson(x)),
            ),
    );
  }
}
