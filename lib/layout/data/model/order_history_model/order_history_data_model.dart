import 'package:elwarsha/layout/domain/entities/order_history_entitiy/order_history_data_entity.dart';

class OrderHistoryDataModel extends OrderHistoryDataEntity {
  const OrderHistoryDataModel({
    required super.id,
    required super.userId,
    required super.type,
    required super.carType,
    required super.description,
    required super.createdAt,
  });

  factory OrderHistoryDataModel.fromJson(Map<String, dynamic> json) =>
      OrderHistoryDataModel(
        carType: json['car_type'],
        createdAt: json['created_at'],
        description: json['description']??'',
        id: json['id'],
        type: json['type'],
        userId: json['user_id'],
      );
}
