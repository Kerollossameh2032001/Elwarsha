import 'package:dartz/dartz.dart';
import 'package:elwarsha/core/exceptions/failure.dart';
import 'package:elwarsha/core/global/base_usecase/base_usecase.dart';
import 'package:elwarsha/winch/domain/base_repository/base_winch_erpository.dart';
import 'package:elwarsha/winch/domain/entities/winch_entity.dart';
import 'package:equatable/equatable.dart';

class WinchUseCase extends BaseUseCase<WinchEntity, WinchParameter> {
  final BaseWinchRepository baseWinchRepository;

  WinchUseCase(this.baseWinchRepository);

  @override
  Future<Either<Failure, WinchEntity>> call(WinchParameter parameter) async {
    return await baseWinchRepository.makeWinchOrder(parameter);
  }
}

class WinchParameter extends Equatable {
  final String token;
  final String carType;
  final double lagFrom;
  final double latFrom;
  final double lagTo;
  final double latTo;
  final String description;
  final String cityFrom;
  final String cityTo;

  const WinchParameter({
    required this.token,
    required this.carType,
    required this.lagFrom,
    required this.latFrom,
    required this.lagTo,
    required this.latTo,
    required this.description,
    required this.cityFrom,
    required this.cityTo,
  });

  static Map<String, dynamic> toJson(WinchParameter parameter) => {
        'car_type': parameter.carType,
        'lag_from': parameter.lagFrom,
        'lat_from': parameter.latFrom,
        'lag_to': parameter.lagTo,
        'lat_to': parameter.latTo,
        'description': parameter.description,
        'city_from': parameter.cityFrom,
        'city_to': parameter.cityTo,
      };

  @override
  List<Object> get props => [
        token,
        carType,
        lagFrom,
        latFrom,
        lagTo,
        latTo,
        description,
        cityFrom,
        cityTo,
      ];
}
