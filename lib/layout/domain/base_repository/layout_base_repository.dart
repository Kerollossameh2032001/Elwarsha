import 'package:dartz/dartz.dart';
import 'package:elwarsha/layout/domain/entities/check_subscription_entity/check_subcription_entity.dart';
import 'package:elwarsha/layout/domain/entities/order_history_entitiy/order_history_entity.dart';
import 'package:elwarsha/layout/domain/entities/profile_entities/profile_entity.dart';
import 'package:elwarsha/layout/domain/entities/slider_entities/slider_entity.dart';
import 'package:elwarsha/layout/domain/usecase/get_products_usecase.dart';
import 'package:elwarsha/layout/domain/usecase/get_profile_data_usecase.dart';
import 'package:elwarsha/layout/domain/usecase/get_slides_usecase.dart';
import '../../../core/exceptions/failure.dart';
import '../entities/products_entities/products_entity.dart';
import '../entities/update_profile_entity/update_profile_entity.dart';
import '../usecase/check_subscription_usecase.dart';
import '../usecase/get_order_history_usercase.dart';
import '../usecase/update_profile_usecase.dart';

abstract class BaseLayoutRepository{
  Future<Either<Failure,SliderEntity>> getSlides(SlideParameter parameter);
  Future<Either<Failure,ProductEntity>> getProducts(ProductParameter parameter);
  Future<Either<Failure,ProfileEntity>> getProfileData(ProfileParameter parameter);
  Future<Either<Failure,UpdateProfileEntity>> updateProfileData(UpdateProfileParameter parameter);
  Future<Either<Failure,OrderHistoryEntity>> getOrderHistory(OrderHistoryParameter parameter);
  Future<Either<Failure,CheckSubscriptionEntity>> checkSubscription(CheckSubscriptionParameter parameter);
}