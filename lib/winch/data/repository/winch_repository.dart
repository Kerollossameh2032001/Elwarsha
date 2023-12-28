import 'package:dartz/dartz.dart';
import 'package:elwarsha/core/exceptions/failure.dart';
import 'package:elwarsha/winch/data/data_source/winch_data_source.dart';
import 'package:elwarsha/winch/domain/base_repository/base_winch_erpository.dart';
import 'package:elwarsha/winch/domain/entities/winch_entity.dart';
import 'package:elwarsha/winch/domain/usecase/winch_usecase.dart';
import '../../../core/exceptions/exceptions.dart';

class WinchRepository extends BaseWinchRepository {
  final BaseWinchDataSource baseWinchDataSource;

  WinchRepository(this.baseWinchDataSource);

  @override
  Future<Either<Failure, WinchEntity>> makeWinchOrder(WinchParameter parameter) async {
    try{
      var result = await baseWinchDataSource.makeOrderWinch(parameter);
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

}
