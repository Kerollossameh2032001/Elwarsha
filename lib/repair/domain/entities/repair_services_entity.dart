import 'package:equatable/equatable.dart';

class RepairServicesEntity extends Equatable {
  final String name;

  const RepairServicesEntity({required this.name});

  @override
  List<Object> get props => [name];
}