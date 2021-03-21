class Project {
  final String? name;
  final String? description;
  final String? url;
  final String? imagePath;

  Project(
      {required this.name,
      required this.description,
      required this.url,
      required this.imagePath});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
        name: json['name'],
        description: json['description'],
        url: json['url'],
        imagePath: json['imagePath']);
  }
}
