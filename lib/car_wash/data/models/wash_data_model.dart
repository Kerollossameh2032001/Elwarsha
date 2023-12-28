import 'package:elwarsha/car_wash/domain/entities/wash_data.dart';

class WashDataModel extends WashDataEntity {
  const WashDataModel({
    required super.userId,
    required super.type,
    required super.carType,
    required super.city,
    required super.lag,
    required super.lat,
    required super.status,
    required super.description,
    required super.updatedAt,
    required super.createdAt,
    required super.id,
  });

  factory WashDataModel.fromJson(Map<String, dynamic> json) => WashDataModel(
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
  );
}

