import 'package:dartz/dartz.dart';
import 'package:elwarsha/core/exceptions/failure.dart';
import 'package:elwarsha/core/global/base_usecase/base_usecase.dart';
import 'package:elwarsha/repair/domain/base_repsitory/base_repair_repository.dart';
import 'package:elwarsha/repair/domain/entities/repair_entity.dart';
import 'package:equatable/equatable.dart';

class RepairUseCase extends BaseUseCase<RepairEntity, RepairParameter>{
  final BaseRepairRepository baseRepairRepository;

  RepairUseCase(this.baseRepairRepository);

  @override
  Future<Either<Failure, RepairEntity>> call(RepairParameter parameter) async {
  return await baseRepairRepository.makeRepairOrder(parameter);
  }

}

class RepairParameter extends Equatable {
  final String token;
  final String carType;
  final double lag;
  final double lat;
  final String description;
  final String city;
  final List<int> repairService;

  const RepairParameter({
    required this.token,
    required this.carType,
    required this.lag,
    required this.lat,
    required this.description,
    required this.city,
    required this.repairService,
  });

  static Map<String, dynamic> toJson(RepairParameter parameter) => {
    'car_type': parameter.carType,
    'lag': parameter.lag,
    'lat': parameter.lat,
    'description': parameter.description,
    'city': parameter.city,
    'RepairService': parameter.repairService,
  };

  @override
  List<Object> get props => [
    token,
    carType,
    lag,
    lat,
    description,
    city,
    repairService
  ];
}