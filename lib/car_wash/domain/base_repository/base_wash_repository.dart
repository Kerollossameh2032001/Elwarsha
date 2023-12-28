import 'package:dartz/dartz.dart';

import '../../../core/exceptions/failure.dart';
import '../entities/wash_entity.dart';
import '../usecase/wash_usecase.dart';

abstract class BaseWashRepository {
  Future<Either<Failure, WashEntity>> makeWashOrder(WashParameter parameter);
}