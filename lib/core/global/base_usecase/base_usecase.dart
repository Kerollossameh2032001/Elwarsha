import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../exceptions/failure.dart';

abstract class BaseUseCase<T, Parameter> {
  Future<Either<Failure,T>> call(Parameter parameter);
}

class NoParameter extends Equatable {
  @override
  List<Object?> get props => [];
}
