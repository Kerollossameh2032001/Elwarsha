import 'package:elwarsha/subscription/data/models/subscription_data_model.dart';
import 'package:elwarsha/subscription/domain/entities/make_subscription_entity/make_subscribtion_entity.dart';

class MakeSubscriptionModel extends MakeSubscriptionEntity {
  const MakeSubscriptionModel({
    required super.message,
    required super.data,
  });

  factory MakeSubscriptionModel.fromJson(Map<String, dynamic> json) => MakeSubscriptionModel(
    message: json["message"][0],
    data:  SubscriptionDataModel.fromJson(json['data']),
  );
}
