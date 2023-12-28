import 'package:equatable/equatable.dart';

class CheckSubscriptionEntity extends Equatable {
  final String message;

  const CheckSubscriptionEntity({required this.message});

  @override
  List<Object> get props => [message];
}