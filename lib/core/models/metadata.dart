class Metadata {
  const Metadata({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
  });

  final int currentPage;
  final int numberOfPages;
  final int limit;

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      currentPage: json["currentPage"] ?? 0,
      numberOfPages: json["numberOfPages"] ?? 0,
      limit: json["limit"] ?? 0,
    );
  }
}
