import 'package:elwarsha/winch/domain/entities/winch_data.dart';
import 'package:elwarsha/winch/domain/usecase/winch_usecase.dart';

class WinchDataModel extends WinchDataEntity {
  WinchDataModel({
    required super.userId,
    required super.type,
    required super.carType,
    required super.cityFrom,
    required super.cityTo,
    required super.lagFrom,
    required super.latFrom,
    required super.lagTo,
    required super.latTo,
    required super.status,
    required super.description,
    required super.updatedAt,
    required super.createdAt,
    required super.id,
  });

  factory WinchDataModel.fromJson(Map<String, dynamic> json) => WinchDataModel(
        userId: json['user_id'],
        type: json['type'],
        carType: json['car_type'],
        cityFrom: json['city_from'],
        cityTo: json['city_to'],
        lagFrom: json['lag_from'],
        latFrom: json['lat_from'],
        lagTo: json['lag_to'],
        latTo: json['lat_to'],
        status: json['status'],
        description: json['description'],
        updatedAt: json['updated_at'],
        createdAt: json['created_at'],
        id: json['id'],
      );
}
