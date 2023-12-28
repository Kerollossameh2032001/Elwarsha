import 'package:equatable/equatable.dart';

class SubscriptionDataEntity extends Equatable {
  final int id;
  final String subscriberType;
  final int subscriberId;
  final int planId;
  final String slug;
  final String name;
  final String? description;
  final String trialEndsAt;
  final String startsAt;
  final String endsAt;
  final String? cancelsAt;
  final String? canceledAt;
  final String? timezone;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  const SubscriptionDataEntity({
    required this.id,
    required this.subscriberType,
    required this.subscriberId,
    required this.planId,
    required this.slug,
    required this.name,
    required this.description,
    required this.trialEndsAt,
    required this.startsAt,
    required this.endsAt,
    required this.cancelsAt,
    required this.canceledAt,
    required this.timezone,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  @override
  List<Object?> get props =>
      [
        id,
        subscriberType,
        subscriberId,
        planId,
        slug,
        name,
        description,
        trialEndsAt,
        startsAt,
        endsAt,
        cancelsAt,
        canceledAt,
        timezone,
        createdAt,
        updatedAt,
        deletedAt,
      ];
}
