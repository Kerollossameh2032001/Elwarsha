import 'package:dartz/dartz.dart';
import '../../../core/exceptions/failure.dart';
import '../entities/repair_entity.dart';
import '../usecase/repair_usecase.dart';

abstract class BaseRepairRepository {
  Future<Either<Failure, RepairEntity>> makeRepairOrder(RepairParameter parameter);
}
