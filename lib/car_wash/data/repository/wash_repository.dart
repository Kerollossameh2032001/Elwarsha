import 'package:dartz/dartz.dart';
import 'package:elwarsha/core/exceptions/failure.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../domain/base_repository/base_wash_repository.dart';
import '../../domain/entities/wash_entity.dart';
import '../../domain/usecase/wash_usecase.dart';
import '../data_source/wash_data_source.dart';

class WashRepository extends BaseWashRepository {
  final BaseWashDataSource baseWashDataSource;

  WashRepository(this.baseWashDataSource);

  @override
  Future<Either<Failure, WashEntity>> makeWashOrder(WashParameter parameter) async {
    try{
      var result = await baseWashDataSource.makeOrderWash(parameter);
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

}
