
import '../../../domain/entities/fuel_entity.dart';

abstract class FuelStates {}

class FuelInitialState extends FuelStates {}

class LoadingMakeFuelOrderState extends FuelStates {}

class SuccessMakeFuelOrderState extends FuelStates {
  final FuelEntity makeFuelOrderResponse;

  SuccessMakeFuelOrderState({required this.makeFuelOrderResponse});
}

class ErrorMakeFuelOrderState extends FuelStates {
  final String errorMessage;
  ErrorMakeFuelOrderState({required this.errorMessage});
}
