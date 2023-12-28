import 'package:dartz/dartz.dart';
import 'package:elwarsha/core/exceptions/failure.dart';
import 'package:elwarsha/subscription/data/data_source/subscription_data_source.dart';
import 'package:elwarsha/subscription/domain/entities/renew_subscription_entity/renue_subscription_entity.dart';
import 'package:elwarsha/subscription/domain/entities/subscribtion_data_entitiy.dart';
import 'package:elwarsha/subscription/domain/usecase/get_all_subscription_usecase.dart';
import 'package:elwarsha/subscription/domain/usecase/make_subscription_usecase.dart';
import 'package:elwarsha/subscription/domain/usecase/renew_subscription_usecase.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../domain/base_repository/base_subscription_repository.dart';
import '../../domain/entities/make_subscription_entity/make_subscribtion_entity.dart';

class SubscriptionRepository extends BaseSubscriptionRepository {
  final BaseSubscriptionDataSource baseSubscriptionDataSource;

  SubscriptionRepository(this.baseSubscriptionDataSource);



  @override
  Future<Either<Failure, MakeSubscriptionEntity>> makeSubscription(MakeSubscriptionParameter parameter) async {
    try{
      var result = await baseSubscriptionDataSource.makeSubscription(parameter);
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<SubscriptionDataEntity>>> getAllUserSubscriptions(AllUserSubscriptionsParameter parameter) async{
    try{
      var result = await baseSubscriptionDataSource.getAllUserSubscription(parameter);
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, RenewSubscriptionEntity>> renewSubscription(RenewSubscriptionParameter parameter) async {
    try{
      var result = await baseSubscriptionDataSource.renewSubscription(parameter);
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

}
