import 'package:dartz/dartz.dart';
import 'package:elwarsha/core/exceptions/failure.dart';
import 'package:elwarsha/layout/data/layout_data_source/layout_data_source.dart';
import 'package:elwarsha/layout/domain/base_repository/layout_base_repository.dart';
import 'package:elwarsha/layout/domain/entities/check_subscription_entity/check_subcription_entity.dart';
import 'package:elwarsha/layout/domain/entities/order_history_entitiy/order_history_entity.dart';
import 'package:elwarsha/layout/domain/entities/products_entities/products_entity.dart';
import 'package:elwarsha/layout/domain/entities/profile_entities/profile_entity.dart';
import 'package:elwarsha/layout/domain/entities/slider_entities/slider_entity.dart';
import 'package:elwarsha/layout/domain/entities/update_profile_entity/update_profile_entity.dart';
import 'package:elwarsha/layout/domain/usecase/check_subscription_usecase.dart';
import 'package:elwarsha/layout/domain/usecase/get_order_history_usercase.dart';
import 'package:elwarsha/layout/domain/usecase/get_products_usecase.dart';
import 'package:elwarsha/layout/domain/usecase/get_profile_data_usecase.dart';
import 'package:elwarsha/layout/domain/usecase/update_profile_usecase.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../domain/usecase/get_slides_usecase.dart';

class LayoutRepository extends BaseLayoutRepository{
  final BaseLayoutDataSource baseLayoutDataSource;

  LayoutRepository(this.baseLayoutDataSource);

  @override
  Future<Either<Failure, SliderEntity>> getSlides(SlideParameter parameter) async{
    try{
      var result = await baseLayoutDataSource.getSlides(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProducts(ProductParameter parameter) async{
    try{
      var result = await baseLayoutDataSource.gerProducts(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> getProfileData(ProfileParameter parameter) async {
    try{
      var result = await baseLayoutDataSource.gerProfile(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, OrderHistoryEntity>> getOrderHistory(OrderHistoryParameter parameter) async{
    try{
      var result = await baseLayoutDataSource.gerOrderHistory(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, CheckSubscriptionEntity>> checkSubscription(CheckSubscriptionParameter parameter) async {
    try{
      var result = await baseLayoutDataSource.checkSubscription(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, UpdateProfileEntity>> updateProfileData(UpdateProfileParameter parameter) async {
    try{
      var result = await baseLayoutDataSource.updateProfile(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
}