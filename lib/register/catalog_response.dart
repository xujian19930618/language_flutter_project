class CatalogResponse {
  final List<String> repositories;

  CatalogResponse({required this.repositories});

  factory CatalogResponse.fromJson(Map<String, dynamic> json) {
    return CatalogResponse(
      repositories: List<String>.from(json['repositories'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {'repositories': repositories};
  }
}
