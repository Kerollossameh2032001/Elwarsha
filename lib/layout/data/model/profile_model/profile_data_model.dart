import 'package:elwarsha/layout/domain/entities/profile_entities/prfile_data.dart';

class ProfileDataModel extends ProfileData {
  ProfileDataModel({
    required super.name,
    required super.id,
    required super.phone,
    required super.avatar,
    required super.bio,
    required super.status,
    required super.type,
    required super.updatedAt,
    required super.createdAt,
  });

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) =>
      ProfileDataModel(
        name: json['name'],
        id: json['id'],
        phone: json['phone'],
        avatar: json['avatar'],
        bio: json['bio'],
        status: json['Status'],
        type: json['type'],
        updatedAt: json['updated_at'],
        createdAt: json['created_at'],
      );
}
