import 'package:elwarsha/layout/domain/entities/products_entities/products_entity.dart';
import 'package:elwarsha/layout/domain/entities/profile_entities/profile_entity.dart';
import 'package:elwarsha/layout/domain/entities/slider_entities/slider_entity.dart';

import '../../../domain/entities/order_history_entitiy/order_history_entity.dart';
import '../../../domain/entities/update_profile_entity/update_profile_entity.dart';

abstract class LayoutStates {}

class LayoutInitialState extends LayoutStates {}

class LayoutChangeBottomNavBar extends LayoutStates {}

class AppChangeCarousalActiveIndexState extends LayoutStates {}

class GetSlidesLoadingState extends LayoutStates {}

class GetSlidesErrorState extends LayoutStates {
  final String errorMessage;

  GetSlidesErrorState({required this.errorMessage});
}

class GetSlidesSuccessState extends LayoutStates {
  final SliderEntity sliders;

  GetSlidesSuccessState({required this.sliders});
}

class GetProductsLoadingState extends LayoutStates {}

class GetProductsErrorState extends LayoutStates {
  final String errorMessage;

  GetProductsErrorState({required this.errorMessage});
}

class GetProductsSuccessState extends LayoutStates {
  final ProductEntity products;

  GetProductsSuccessState({required this.products});
}

class GetProfileLoadingState extends LayoutStates {}

class GetProfileErrorState extends LayoutStates {
  final String errorMessage;

  GetProfileErrorState({required this.errorMessage});
}

class GetProfileSuccessState extends LayoutStates {
  final ProfileEntity userData;

  GetProfileSuccessState({required this.userData});
}

class UpdateProfileLoadingState extends LayoutStates {}

class UpdateProfileErrorState extends LayoutStates {
  final String errorMessage;

  UpdateProfileErrorState({required this.errorMessage});
}

class UpdateProfileSuccessState extends LayoutStates {
  final UpdateProfileEntity userData;

  UpdateProfileSuccessState({required this.userData});
}


class CheckSubscriptionLoadingState extends LayoutStates {}

class CheckSubscriptionErrorState extends LayoutStates {
  final String errorMessage;

  CheckSubscriptionErrorState({required this.errorMessage});
}

class CheckSubscriptionSuccessState extends LayoutStates {
  final bool subscribed;

  CheckSubscriptionSuccessState({required this.subscribed});
}

class LoadingUploadUserPhotoState extends LayoutStates {}

class SuccessUploadUserPhotoState extends LayoutStates {
  final String userImage;
  SuccessUploadUserPhotoState(this.userImage);
}

class ErrorUploadUserPhotoState extends LayoutStates {
  final String error;
  ErrorUploadUserPhotoState(this.error);
}

class LoadingGetUserCurrentLocationState extends LayoutStates {}
class SuccessGetUserCurrentLocationState extends LayoutStates {
  final String lat, long;

  SuccessGetUserCurrentLocationState(this.lat, this.long);
}

class ErrorGetUserCurrentLocationState extends LayoutStates {
  final String Error;

  ErrorGetUserCurrentLocationState(this.Error);
}

class GetOrderHistoryLoadingState extends LayoutStates {}

class EnableUpdateDataState extends LayoutStates {}

class GetOrderHistoryErrorState extends LayoutStates {
  final String errorMessage;

  GetOrderHistoryErrorState({required this.errorMessage});
}

class GetOrderHistorySuccessState extends LayoutStates {
  final OrderHistoryEntity orderHistory;

  GetOrderHistorySuccessState({required this.orderHistory});
}

class PaymentAuthLoadingStates extends LayoutStates {}

class PaymentAuthSuccessStates extends LayoutStates {}

class PaymentAuthErrorStates extends LayoutStates {
  final String error;
  PaymentAuthErrorStates( this.error);
}

class LogOutLoadingStates extends LayoutStates {}

class LogOutSuccessStates extends LayoutStates {}