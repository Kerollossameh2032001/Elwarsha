import 'package:equatable/equatable.dart';

class RenewSubscriptionEntity extends Equatable {
  final String message;

  const RenewSubscriptionEntity({required this.message});

  @override
  List<Object> get props => [message];
}