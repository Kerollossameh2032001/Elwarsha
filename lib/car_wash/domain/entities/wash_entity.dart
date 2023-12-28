import 'package:elwarsha/car_wash/domain/entities/wash_data.dart';
import 'package:equatable/equatable.dart';

class WashEntity extends Equatable {
  final String message;
  final WashDataEntity order;

  const WashEntity({
    required this.message,
    required this.order,
  });

  @override
  List<Object> get props => [message, order];
}
