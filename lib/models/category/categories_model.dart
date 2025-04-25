class Categories {
  String slug;
  String name;
  String url;
  String imageUrl;

  Categories({
    required this.slug,
    required this.name,
    required this.url,
    required this.imageUrl,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    print('Parsing category: ${json["name"]}, url: ${json["url"]}');

    return Categories(
      slug: json["slug"],
      name: json["name"],
      imageUrl: '',
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {"slug": slug, "name": name, "url": url};
}
