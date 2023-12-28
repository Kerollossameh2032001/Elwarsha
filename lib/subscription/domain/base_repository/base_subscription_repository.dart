import 'package:dartz/dartz.dart';
import 'package:elwarsha/subscription/domain/entities/make_subscription_entity/make_subscribtion_entity.dart';
import 'package:elwarsha/subscription/domain/entities/renew_subscription_entity/renue_subscription_entity.dart';
import 'package:elwarsha/subscription/domain/entities/subscribtion_data_entitiy.dart';
import '../../../core/exceptions/failure.dart';
import '../usecase/get_all_subscription_usecase.dart';
import '../usecase/make_subscription_usecase.dart';
import '../usecase/renew_subscription_usecase.dart';

abstract class BaseSubscriptionRepository {
  Future<Either<Failure, MakeSubscriptionEntity>> makeSubscription(MakeSubscriptionParameter parameter);
  Future<Either<Failure, RenewSubscriptionEntity>> renewSubscription(RenewSubscriptionParameter parameter);
  Future<Either<Failure, List<SubscriptionDataEntity>>> getAllUserSubscriptions(AllUserSubscriptionsParameter parameter);
}
