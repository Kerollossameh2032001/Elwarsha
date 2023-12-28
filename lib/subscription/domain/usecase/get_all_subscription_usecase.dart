import 'package:dartz/dartz.dart';
import 'package:elwarsha/core/exceptions/failure.dart';
import 'package:elwarsha/core/global/base_usecase/base_usecase.dart';
import 'package:elwarsha/subscription/domain/base_repository/base_subscription_repository.dart';
import 'package:elwarsha/subscription/domain/entities/subscribtion_data_entitiy.dart';
import 'package:equatable/equatable.dart';

class GetALlUserSubscriptionUseCase extends BaseUseCase<
    List<SubscriptionDataEntity>, AllUserSubscriptionsParameter> {
  final BaseSubscriptionRepository baseSubscriptionRepository;

  GetALlUserSubscriptionUseCase(this.baseSubscriptionRepository);

  @override
  Future<Either<Failure, List<SubscriptionDataEntity>>> call(
      AllUserSubscriptionsParameter parameter) async {
    return await baseSubscriptionRepository.getAllUserSubscriptions(parameter);
  }
}

class AllUserSubscriptionsParameter extends Equatable {
  final String token;

  const AllUserSubscriptionsParameter({
    required this.token,
  });

  @override
  List<Object> get props => [token];
}
