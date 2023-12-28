import 'package:elwarsha/subscription/domain/entities/subscribtion_data_entitiy.dart';

class SubscriptionDataModel extends SubscriptionDataEntity {
  const SubscriptionDataModel({
    required super.id,
    required super.subscriberType,
    required super.subscriberId,
    required super.planId,
    required super.slug,
    required super.name,
    required super.description,
    required super.trialEndsAt,
    required super.startsAt,
    required super.endsAt,
    required super.cancelsAt,
    required super.canceledAt,
    required super.timezone,
    required super.createdAt,
    required super.updatedAt,
    required super.deletedAt,
  });

  factory SubscriptionDataModel.fromJson(Map<String, dynamic> json) => SubscriptionDataModel(
    id: json['id'],
    subscriberType: json['subscriber_type'],
    subscriberId: json['subscriber_id'],
    planId: json['plan_id'],
    slug: json['slug'],
    name: json['name'],
    description: json['description'],
    trialEndsAt: json['trial_ends_at'],
    startsAt: json['starts_at'],
    endsAt: json['ends_at'],
    cancelsAt: json['cancels_at'],
    canceledAt: json['canceled_at'],
    timezone: json['timezone'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
    deletedAt: json['deleted_at'],
  );
}
