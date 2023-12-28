import 'package:elwarsha/subscription/domain/entities/subscribtion_data_entitiy.dart';
import 'package:equatable/equatable.dart';

class MakeSubscriptionEntity extends Equatable {
  final String message;
  final SubscriptionDataEntity data;

  const MakeSubscriptionEntity({
    required this.message,
    required this.data,
  });

  @override
  List<Object> get props => [message,data];
}
