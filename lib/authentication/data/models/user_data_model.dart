import '../../domain/entities/user_data.dart';

class UserDataModel extends UserDataEntity {
  const UserDataModel({
    required super.name,
    required super.id,
    required super.phone,
    required super.avatar,
    required super.bio,
    //super.rolesName,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        name: json['name'],
        id: json['id'],
        phone: json['phone'],
        avatar: json['avatar'],
        bio: json['bio'],
        //rolesName: List<String>.from(json['roles_name'] ?? []),
        status: json['Status'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );
}
