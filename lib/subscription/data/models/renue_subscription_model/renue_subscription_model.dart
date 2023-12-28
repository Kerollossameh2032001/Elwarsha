import 'package:elwarsha/subscription/domain/entities/renew_subscription_entity/renue_subscription_entity.dart';

class RenewSubscriptionModel extends RenewSubscriptionEntity {
  const RenewSubscriptionModel({required super.message});

  factory RenewSubscriptionModel.fromJson(Map<String, dynamic> json) =>
      RenewSubscriptionModel(
        message: json['message'],
      );
}
