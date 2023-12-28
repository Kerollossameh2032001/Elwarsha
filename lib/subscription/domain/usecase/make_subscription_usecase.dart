import 'package:dartz/dartz.dart';
import 'package:elwarsha/core/exceptions/failure.dart';
import 'package:elwarsha/core/global/base_usecase/base_usecase.dart';
import 'package:elwarsha/subscription/domain/base_repository/base_subscription_repository.dart';
import 'package:equatable/equatable.dart';

import '../entities/make_subscription_entity/make_subscribtion_entity.dart';

class MakeSubscriptionUserCase
    extends BaseUseCase<MakeSubscriptionEntity, MakeSubscriptionParameter> {
  final BaseSubscriptionRepository baseSubscriptionRepository;

  MakeSubscriptionUserCase(this.baseSubscriptionRepository);

  @override
  Future<Either<Failure, MakeSubscriptionEntity>> call(
      MakeSubscriptionParameter parameter) async {
    return await baseSubscriptionRepository.makeSubscription(parameter);
  }
}

class MakeSubscriptionParameter extends Equatable {
  final String token;
  final int planeId;

  const MakeSubscriptionParameter({
    required this.token,
    required this.planeId,
  });

  static Map<String, dynamic> toJson(MakeSubscriptionParameter parameter)=> {
    'plane_id':parameter.planeId,
  };

  @override
  List<Object> get props => [token, planeId];
}
