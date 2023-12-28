import 'package:dartz/dartz.dart';
import 'package:elwarsha/car_wash/domain/base_repository/base_wash_repository.dart';
import 'package:elwarsha/car_wash/domain/entities/wash_entity.dart';
import 'package:elwarsha/core/exceptions/failure.dart';
import 'package:elwarsha/core/global/base_usecase/base_usecase.dart';
import 'package:equatable/equatable.dart';

class WashUseCase extends BaseUseCase<WashEntity,WashParameter>{
  final BaseWashRepository baseWashRepository;

  WashUseCase(this.baseWashRepository);

  @override
  Future<Either<Failure, WashEntity>> call(WashParameter parameter) async {
  return await baseWashRepository.makeWashOrder(parameter);
  }

}

class WashParameter extends Equatable {
  final String token;
  final String carType;
  final double lag;
  final double lat;
  final String description;
  final String city;

  const WashParameter({
    required this.token,
    required this.carType,
    required this.lag,
    required this.lat,
    required this.description,
    required this.city,
  });

  static Map<String, dynamic> toJson(WashParameter parameter) => {
    'car_type': parameter.carType,
    'lag': parameter.lag,
    'lat': parameter.lat,
    'description': parameter.description,
    'city': parameter.city,
  };

  @override
  List<Object> get props => [
    token,
    carType,
    lag,
    lat,
    description,
    city,
  ];
}