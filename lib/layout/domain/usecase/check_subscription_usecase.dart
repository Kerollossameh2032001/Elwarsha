import 'package:dartz/dartz.dart';
import 'package:elwarsha/core/exceptions/failure.dart';
import 'package:elwarsha/core/global/base_usecase/base_usecase.dart';
import 'package:elwarsha/layout/domain/base_repository/layout_base_repository.dart';
import 'package:elwarsha/layout/domain/entities/check_subscription_entity/check_subcription_entity.dart';
import 'package:equatable/equatable.dart';

class CheckSubscriptionUseCase
    extends BaseUseCase<CheckSubscriptionEntity, CheckSubscriptionParameter> {
  final BaseLayoutRepository baseLayoutRepository;

  CheckSubscriptionUseCase(this.baseLayoutRepository);

  @override
  Future<Either<Failure, CheckSubscriptionEntity>> call(
      CheckSubscriptionParameter parameter) async {
    return await baseLayoutRepository.checkSubscription(parameter);
  }
}

class CheckSubscriptionParameter extends Equatable {
  final String token;

  const CheckSubscriptionParameter({required this.token});

  @override
  List<Object> get props => [token];
}
