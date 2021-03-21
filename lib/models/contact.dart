class Contact {
  String platform;
  String url;
  String imagePath;

  Contact({required this.platform, required this.url, required this.imagePath});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
        platform: json['platform'],
        url: json['url'],
        imagePath: json['imagePath']);
  }
}
