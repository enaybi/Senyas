class Images {
  final int id;
  final String name;
  final String imagePath;

  const Images({required this.name, required this.imagePath, required this.id});

  factory Images.fromJson(Map<String, dynamic> json) =>
      Images(id: json['id'], name: json['name'], imagePath: json['imagePath']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'imagePath': imagePath};
}
