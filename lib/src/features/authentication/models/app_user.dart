import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:googlebooksi/src/core/constants/app_content.dart';
import 'package:googlebooksi/src/features/profile/models/user_file.dart';

class AppUser extends AppContent {
  final String? email;
  final String? firstName;
  final String? lastName;
  final UserFile? profileImage;

  AppUser({
    DateTime? createdAt,
    String? createdBy,
    String? id,
    DateTime? lastUpdatedAt,
    this.email,
    this.firstName,
    this.lastName,
    this.profileImage,
  }) : super(
          createdAt: createdAt,
          id: id,
          createdBy: createdBy,
          lastUpdatedAt: lastUpdatedAt,
        );

  AppUser.fromJson(
    Map<String, dynamic> json, {
    DocumentReference<Map<String, dynamic>>? reference,
  })  : email = json['email'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        profileImage = json['profileImage'] != null
            ? UserFile.fromJson(json['profileImage'])
            : null,
        super.fromJson(json, reference: reference);

  String get fullName => '${firstName ?? ''} ${lastName ?? ''}'.trim();

  @override
  Map<String, dynamic> toJson() => {
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'profileImage': profileImage?.toJson(),
        ...super.toJson(),
      };
}
