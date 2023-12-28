import 'package:equatable/equatable.dart';

class WinchDataEntity extends Equatable {
  final int userId;
  final String type;
  final String carType;
  final String cityFrom;
  final String cityTo;
  final double lagFrom;
  final double latFrom;
  final double lagTo;
  final double latTo;
  final int status;
  final String description;
  final String updatedAt;
  final String createdAt;
  final int id;

  WinchDataEntity({
    required this.userId,
    required this.type,
    required this.carType,
    required this.cityFrom,
    required this.cityTo,
    required this.lagFrom,
    required this.latFrom,
    required this.lagTo,
    required this.latTo,
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
        cityFrom,
        cityTo,
        lagFrom,
        latFrom,
        lagTo,
        latTo,
        status,
        description,
        updatedAt,
        createdAt,
        id,
      ];
}

