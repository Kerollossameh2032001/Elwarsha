import 'package:elwarsha/repair/domain/entities/repair_data_entity.dart';
import 'package:elwarsha/repair/domain/entities/repair_services_entity.dart';
import 'package:equatable/equatable.dart';

class RepairEntity extends Equatable {
  final String message;
  final RepairDataEntity order;
  final List<RepairServicesEntity> services;

  RepairEntity({
    required this.message,
    required this.order,
    required this.services,
  });

  @override
  List<Object> get props => [message, order, services];
}
