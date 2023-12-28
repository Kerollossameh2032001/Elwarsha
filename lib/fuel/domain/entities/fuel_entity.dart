import 'package:equatable/equatable.dart';

import 'fuel_data_entity.dart';

class FuelEntity extends Equatable {
  final String message;
  final FuelDataEntity order;

  const FuelEntity({
    required this.message,
    required this.order,
  });

  @override
  List<Object> get props => [message, order];
}
