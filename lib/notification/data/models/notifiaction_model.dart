// "data": [
// {
// "id": 2,
// "user_id": 3,
// "type": "wash",
// "order_id": 10,
// "message": "Your order has been completed",
// "created_at": "2023-06-24T12:14:45.000000Z",
// "updated_at": "2023-06-24T12:14:45.000000Z"
// },
// ]
import 'package:equatable/equatable.dart';

class NotificationModel extends Equatable {
  final int id;
  final int userId;
  final String type;
  final int orderId;
  final String createdAt;
  final String updatedAt;
  final String message;

  const NotificationModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.orderId,
    required this.createdAt,
    required this.updatedAt,
    required this.message,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      userId: json['user_id'],
      type: json['type'],
      orderId: json['order_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      message: json['message'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        type,
        orderId,
        createdAt,
        updatedAt,
        message,
      ];
}
