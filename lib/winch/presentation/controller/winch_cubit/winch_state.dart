import 'package:elwarsha/winch/domain/entities/winch_entity.dart';

abstract class WinchStates {}

class WinchInitialState extends WinchStates {}

class LoadingMakeWinchOrderState extends WinchStates {}

class SuccessMakeWinchOrderState extends WinchStates {
  final WinchEntity makeWinchOrderResponse;

  SuccessMakeWinchOrderState({required this.makeWinchOrderResponse});
}

class ErrorMakeWinchOrderState extends WinchStates {
  final String errorMessage;
  ErrorMakeWinchOrderState({required this.errorMessage});
}
