  import '../../../domain/entities/wash_entity.dart';

abstract class WashStates {}

class WashInitialState extends WashStates {}

class LoadingMakeWashOrderState extends WashStates {}

class SuccessMakeWashOrderState extends WashStates {
  final WashEntity makeWashOrderResponse;

  SuccessMakeWashOrderState({required this.makeWashOrderResponse});
}

class ErrorMakeWashOrderState extends WashStates {
  final String errorMessage;
  ErrorMakeWashOrderState({required this.errorMessage});
}
