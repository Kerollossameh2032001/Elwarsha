import 'package:dartz/dartz.dart';
import 'package:elwarsha/winch/domain/entities/winch_entity.dart';
import 'package:elwarsha/winch/domain/usecase/winch_usecase.dart';

import '../../../core/exceptions/failure.dart';

abstract class BaseWinchRepository {
  Future<Either<Failure, WinchEntity>> makeWinchOrder(WinchParameter parameter);
}
