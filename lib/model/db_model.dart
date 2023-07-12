class FSL_Class {
  final int id;
  final String imageCategory;
  final String imageName;
  final String imagePath;

  const FSL_Class({
    required this.id,
    required this.imageCategory,
    required this.imageName,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageCategory': imageCategory,
      'imageName': imageName,
      'imagePath': imagePath,
    };
  }

  @override
  String toString() {
    return 'FSL_Class{id: $id, imageCategory: $imageCategory, imageName: $imageName, imagePath: $imagePath}';
  }
}


