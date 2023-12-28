import 'package:dartz/dartz.dart';
import 'package:elwarsha/core/exceptions/failure.dart';
import 'package:elwarsha/core/global/base_usecase/base_usecase.dart';
import 'package:elwarsha/fuel/domain/entities/fuel_entity.dart';
import 'package:equatable/equatable.dart';

import '../base_repository/base_fuel_repository.dart';

class FuelUseCase extends BaseUseCase<FuelEntity,FuelParameter>{
  final BaseFuelRepository baseFuelRepository;

  FuelUseCase(this.baseFuelRepository);

  @override
  Future<Either<Failure, FuelEntity>> call(FuelParameter parameter) async {
    return await baseFuelRepository.makeFuelOrder(parameter);
  }

}

class FuelParameter extends Equatable {
  final String token;
  final String carType;
  final double lag;
  final double lat;
  final String description;
  final String city;
  final double? b80;
  final double? b90;
  final double? b92;
  final double? b95;
  final int electricity;

  const FuelParameter({
    required this.token,
    required this.carType,
    required this.lag,
    required this.lat,
    required this.description,
    required this.city,
    required this.b80,
    required this.b90,
    required this.b92,
    required this.b95,
    required this.electricity,
  });

  static Map<String, dynamic> toJson(FuelParameter parameter) =>
      {
        'car_type': parameter.carType,
        'lag': parameter.lag,
        'lat': parameter.lat,
        'description': parameter.description,
        'city': parameter.city,
        'b80': parameter.b80,
        'b90': parameter.b90,
        'b92': parameter.b92,
        'b95': parameter.b95,
        'electricity': parameter.electricity,
      };

  @override
  List<Object?> get props =>
      [
        token,
        carType,
        lag,
        lat,
        description,
        city,
        b80,
        b90,
        b92,
        b95,
        electricity,
      ];
}