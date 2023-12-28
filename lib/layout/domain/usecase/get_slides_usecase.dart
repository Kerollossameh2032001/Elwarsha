import 'package:dartz/dartz.dart';
import 'package:elwarsha/core/exceptions/failure.dart';
import 'package:elwarsha/core/global/base_usecase/base_usecase.dart';
import 'package:elwarsha/layout/domain/base_repository/layout_base_repository.dart';
import 'package:elwarsha/layout/domain/entities/slider_entities/slider_entity.dart';
import 'package:equatable/equatable.dart';

class GetSlidesUserCase extends BaseUseCase<SliderEntity, SlideParameter> {
  final BaseLayoutRepository baseLayoutRepository;

  GetSlidesUserCase(this.baseLayoutRepository);
  @override
  Future<Either<Failure, SliderEntity>> call(SlideParameter parameter) async {
    return await baseLayoutRepository.getSlides(parameter);
  }
}

class SlideParameter extends Equatable {
  final String token;

  const SlideParameter({required this.token});

  @override
  List<Object> get props => [token];
}