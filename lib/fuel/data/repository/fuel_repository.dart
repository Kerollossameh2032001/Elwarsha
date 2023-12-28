import 'package:dartz/dartz.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../core/exceptions/failure.dart';
import '../../domain/base_repository/base_fuel_repository.dart';
import '../../domain/entities/fuel_entity.dart';
import '../../domain/usecase/fuel_usecase.dart';
import '../data_source/fuel_data_source.dart';

class FuelRepository extends BaseFuelRepository {
  final BaseFuelDataSource baseFuelDataSource;

  FuelRepository(this.baseFuelDataSource);

  @override
  Future<Either<Failure, FuelEntity>> makeFuelOrder(FuelParameter parameter) async {
    try{
      var result = await baseFuelDataSource.makeOrderFuel(parameter);
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

}