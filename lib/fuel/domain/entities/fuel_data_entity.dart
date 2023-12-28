import 'package:equatable/equatable.dart';

class FuelDataEntity extends Equatable {
  final int userId;
  final String carType;
  final String city;
  final String type;
  final double lag;
  final double lat;
  final double? b80;
  //final double? b90;
  final double? b92;
  final double? b95;
  final int electricity;
  final int status;
  final String description;
  final String updatedAt;
  final String createdAt;
  final int id;

  FuelDataEntity({
    required this.userId,
    required this.type,
    required this.carType,
    required this.city,
    required this.lag,
    required this.lat,
    required this.b80,
    //required this.b90,
    required this.b92,
    required this.b95,
    required this.electricity,
    required this.status,
    required this.description,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  @override
  List<Object?> get props =>
      [
        userId,
        carType,
        city,
        type,
        lag,
        lat,
        b80,
        //b90,
        b92,
        b95,
        electricity,
        status,
        description,
        updatedAt,
        createdAt,
        id,
      ];
}
