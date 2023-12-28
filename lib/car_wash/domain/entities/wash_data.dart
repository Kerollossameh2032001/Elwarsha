import 'package:equatable/equatable.dart';

class WashDataEntity extends Equatable {
  final int userId;
  final String type;
  final String carType;
  final String city;
  final double lag;
  final double lat;
  final int status;
  final String description;
  final String updatedAt;
  final String createdAt;
  final int id;

  const WashDataEntity({
    required this.userId,
    required this.type,
    required this.carType,
    required this.city,
    required this.lag,
    required this.lat,
    required this.status,
    required this.description,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  @override
  List<Object> get props =>
      [
        userId,
        type,
        carType,
        city,
        lag,
        lat,
        status,
        description,
        updatedAt,
        createdAt,
        id,
      ];
}

