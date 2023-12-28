import 'package:equatable/equatable.dart';

class OrderHistoryDataEntity extends Equatable {
  final int id;
  final int userId;
  final String type;
  final String carType;
  final String description;
  final String createdAt;

  const OrderHistoryDataEntity({
    required this.id,
    required this.userId,
    required this.type,
    required this.carType,
    required this.description,
    required this.createdAt,
  });

  @override
  List<Object> get props => [
        id,
        userId,
        type,
        carType,
        description,
        createdAt,
      ];
}
