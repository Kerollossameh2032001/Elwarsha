import 'package:elwarsha/subscription/domain/entities/subscribtion_data_entitiy.dart';

import '../../../domain/entities/make_subscription_entity/make_subscribtion_entity.dart';
import '../../../domain/entities/renew_subscription_entity/renue_subscription_entity.dart';

abstract class SubscriptionStates {}

class SubscriptionInitialState extends SubscriptionStates {}

class PaymentOrderIdLoadingStates extends SubscriptionStates {}

class PaymentOrderIdSuccessStates extends SubscriptionStates {}

class PaymentOrderIdErrorStates extends SubscriptionStates {
  final String error;
  PaymentOrderIdErrorStates(this.error);
}
class PaymentRequestTokenSuccessStates extends SubscriptionStates {}

class PaymentRequestTokenErrorStates extends SubscriptionStates {
  final String error;
  PaymentRequestTokenErrorStates(this.error);
}

class PaymentRequestTokenLoadingStates extends SubscriptionStates {}

class LoadingMakeSubscriptionState extends SubscriptionStates {}

class SuccessMakeSubscriptionState extends SubscriptionStates {
  final MakeSubscriptionEntity makeSubscriptionResponse;

  SuccessMakeSubscriptionState({required this.makeSubscriptionResponse});
}

class ErrorMakeSubscriptionState extends SubscriptionStates {
  final String errorMessage;
  ErrorMakeSubscriptionState({required this.errorMessage});
}

class RenewSubscriptionLoadingState extends SubscriptionStates {}

class RenewSubscriptionSuccessState extends SubscriptionStates {
  final RenewSubscriptionEntity renewSubscriptionResponse;

  RenewSubscriptionSuccessState({required this.renewSubscriptionResponse});
}

class RenewSubscriptionErrorState extends SubscriptionStates {
  final String errorMessage;
  RenewSubscriptionErrorState({required this.errorMessage});
}



class GetAllUserSubscriptionLoadingState extends SubscriptionStates {}

class GetAllUserSubscriptionSuccessState extends SubscriptionStates {
  final List<SubscriptionDataEntity> getAllUserSubscriptionResponse;

  GetAllUserSubscriptionSuccessState({required this.getAllUserSubscriptionResponse});
}

class GetAllUserSubscriptionErrorState extends SubscriptionStates {
  final String errorMessage;
  GetAllUserSubscriptionErrorState({required this.errorMessage});
}


