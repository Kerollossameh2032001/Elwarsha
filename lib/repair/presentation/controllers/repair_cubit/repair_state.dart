
import '../../../domain/entities/repair_entity.dart';

abstract class RepairStates {}

class RepairInitialState extends RepairStates {}

class LoadingMakeRepairOrderState extends RepairStates {}

class SuccessMakeRepairOrderState extends RepairStates {
  final RepairEntity makeRepairOrderResponse;

  SuccessMakeRepairOrderState({required this.makeRepairOrderResponse});
}

class ErrorMakeRepairOrderState extends RepairStates {
  final String errorMessage;
  ErrorMakeRepairOrderState({required this.errorMessage});
}
