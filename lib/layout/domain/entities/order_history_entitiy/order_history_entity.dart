import 'package:equatable/equatable.dart';
import 'order_history_data_entity.dart';

class OrderHistoryEntity extends Equatable {
  final List<OrderHistoryDataEntity> data;
  final int status;

  const OrderHistoryEntity({required this.data, required this.status});

  @override
  List<Object> get props => [data, status];
}