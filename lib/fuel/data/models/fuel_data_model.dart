import 'dart:ffi';

import 'package:elwarsha/fuel/domain/entities/fuel_data_entity.dart';

class FuelDataModel extends FuelDataEntity {
  FuelDataModel({
    required super.userId,
    required super.type,
    required super.carType,
    required super.city,
    required super.lag,
    required super.lat,
    required super.electricity,
    required super.status,
    required super.description,
    required super.updatedAt,
    required super.createdAt,
    required super.id,
    required super.b80,
    //required super.b90,
    required super.b92,
    required super.b95,
  });

  factory FuelDataModel.fromJson(Map<String, dynamic> json) => FuelDataModel(
        userId: json['user_id'],
        type: json['type'],
        carType: json['car_type'],
        city: json['city'],
        lag: json['lag'],
        lat: json['lat'],
        status: json['status'],
        description: json['description'],
        updatedAt: json['updated_at'],
        createdAt: json['created_at'],
        id: json['id'],
        electricity: json['electricity'],
        b80: double.parse(json['b80'].toString()),
        //b90: double.parse(json['b90'].toString()),
        b92: double.parse(json['b92'].toString()),
        b95: double.parse(json['b95'].toString()),
      );
}
