import 'package:equatable/equatable.dart';

class ProfileData extends Equatable {
  final String name;
  final int id;
  final String phone;
  final String? avatar;
  final String? bio;
  final String? status;
  final String type;
  final String updatedAt;
  final String createdAt;

  const ProfileData({
    required this.name,
    required this.id,
    required this.phone,
    required this.avatar,
    required this.bio,
    required this.status,
    required this.type,
    required this.updatedAt,
    required this.createdAt,
  });

  @override
  List<Object?> get props =>
      [name, id, phone, avatar, bio, status, type, updatedAt, createdAt];
}
