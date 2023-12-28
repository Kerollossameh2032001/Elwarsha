import 'package:elwarsha/layout/domain/entities/check_subscription_entity/check_subcription_entity.dart';

class CheckSubscriptionModel extends CheckSubscriptionEntity {
  const CheckSubscriptionModel({required super.message});

  factory CheckSubscriptionModel.fromJson(Map<String, dynamic> json) =>
      CheckSubscriptionModel(
        message: json['message'][0],
      );
}
