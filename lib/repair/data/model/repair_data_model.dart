import 'package:elwarsha/repair/domain/entities/repair_data_entity.dart';

class RepairDataModel extends RepairDataEntity {
  RepairDataModel({
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

  factory RepairDataModel.fromJson(Map<String, dynamic> json) => RepairDataModel(
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
