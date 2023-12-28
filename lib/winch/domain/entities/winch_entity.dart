import 'package:elwarsha/winch/domain/entities/winch_data.dart';
import 'package:equatable/equatable.dart';

class WinchEntity extends Equatable {
  final String message;
  final WinchDataEntity order;

  WinchEntity({
    required this.message,
    required this.order,
  });

  @override
  List<Object> get props => [message, order];
}
