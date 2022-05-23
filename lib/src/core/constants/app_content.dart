import 'package:cloud_firestore/cloud_firestore.dart';

class AppContent {
  final DateTime? createdAt;

  final String? createdBy;

  final String? id;

  final DateTime? lastUpdatedAt;

  DocumentReference<Map<String, dynamic>>? documentReference;
  DocumentSnapshot<Map<String, dynamic>>? documentSnapshot;

  AppContent({
    DateTime? createdAt,
    DateTime? lastUpdatedAt,
    this.createdBy,
    this.id,
  })  : createdAt = createdAt ?? DateTime.now(),
        lastUpdatedAt = lastUpdatedAt ?? DateTime.now();

  AppContent.fromJson(
    Map<String, dynamic> json, {
    DocumentReference<Map<String, dynamic>>? reference,
  })  : createdAt = json['createdAt'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json['createdAt']),
        createdBy = json['createdBy'],
        id = json['id'],
        lastUpdatedAt = json['lastUpdatedAt'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json['lastUpdatedAt']),
        documentReference = reference;

  @override
  int get hashCode =>
      (createdAt?.microsecondsSinceEpoch ?? 0) +
      (id?.hashCode ?? 0) +
      (createdBy?.hashCode ?? 0);

  @override
  bool operator ==(Object other) =>
      (other is AppContent && other.id != null) ? other.id == id : false;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'createdAt': createdAt?.millisecondsSinceEpoch,
        'createdBy': createdBy,
        'id': id,
        'lastUpdatedAt': lastUpdatedAt?.millisecondsSinceEpoch,
      };
}
