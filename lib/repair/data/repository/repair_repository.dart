import 'package:dartz/dartz.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../core/exceptions/failure.dart';
import '../../domain/base_repsitory/base_repair_repository.dart';
import '../../domain/entities/repair_entity.dart';
import '../../domain/usecase/repair_usecase.dart';
import '../data_source/repair_data_source.dart';

class RepairRepository extends BaseRepairRepository {
  final BaseRepairDataSource baseRepairDataSource;

  RepairRepository(this.baseRepairDataSource);

  @override
  Future<Either<Failure, RepairEntity>> makeRepairOrder(RepairParameter parameter) async {
    try{
      var result = await baseRepairDataSource.makeRepairOrder(parameter);
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

}