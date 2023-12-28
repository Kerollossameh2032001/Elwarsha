import 'package:dartz/dartz.dart';
import 'package:elwarsha/core/exceptions/failure.dart';
import 'package:elwarsha/core/global/base_usecase/base_usecase.dart';
import 'package:elwarsha/subscription/domain/base_repository/base_subscription_repository.dart';
import 'package:elwarsha/subscription/domain/entities/renew_subscription_entity/renue_subscription_entity.dart';
import 'package:equatable/equatable.dart';

class RenewSubscriptionUseCase
    extends BaseUseCase<RenewSubscriptionEntity, RenewSubscriptionParameter> {
  final BaseSubscriptionRepository baseSubscriptionRepository;

  RenewSubscriptionUseCase(this.baseSubscriptionRepository);

  @override
  Future<Either<Failure, RenewSubscriptionEntity>> call(
      RenewSubscriptionParameter parameter) async {
    return await baseSubscriptionRepository.renewSubscription(parameter);
  }
}

class RenewSubscriptionParameter extends Equatable {
  final String token;

  const RenewSubscriptionParameter({required this.token});

  @override
  List<Object> get props => [token];
}
