import 'package:dartz/dartz.dart';

import '../../../core/exceptions/failure.dart';
import '../entities/fuel_entity.dart';
import '../usecase/fuel_usecase.dart';

abstract class BaseFuelRepository {
  Future<Either<Failure, FuelEntity>> makeFuelOrder(FuelParameter parameter);
}