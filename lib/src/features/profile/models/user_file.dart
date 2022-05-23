import 'package:googlebooksi/src/core/constants/app_content.dart';

class UserFile extends AppContent {
  String? altText;
  String? name;
  String? storagePath;
  // XFile? data;
  bool hasBeenDeleted;
  String? downloadUrl;

  int width;
  int height;

  String? thumbnailPath;

  UserFile({
    DateTime? createdAt,
    DateTime? lastUpdatedAt,
    String? id,
    String? createdBy,
    this.altText,
    this.name,
    this.storagePath,
    // this.data,
    this.hasBeenDeleted = false,
    this.downloadUrl,
    this.height = 500,
    this.width = 750,
  }) : super(
          createdAt: createdAt,
          lastUpdatedAt: lastUpdatedAt,
          id: id,
          createdBy: createdBy,
        );

  UserFile.fromJson(Map<String, dynamic> json)
      : altText = json['altText'],
        name = json['name'],
        storagePath = json['storagePath'],
        hasBeenDeleted = json['hasBeenDeleted'],
        downloadUrl = json['downloadUrl'],
        width = json['width'] ?? 3000,
        height = json['height'] ?? 2000,
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{
      'altText': altText,
      'name': name,
      'storagePath': storagePath,
      'hasBeenDeleted': hasBeenDeleted,
      'downloadUrl': downloadUrl,
      'width': width,
      'height': height,
    });
}
