import 'package:dartz/dartz.dart';
import 'package:elwarsha/core/exceptions/failure.dart';
import 'package:elwarsha/core/global/base_usecase/base_usecase.dart';
import 'package:equatable/equatable.dart';

import '../base_repository/layout_base_repository.dart';
import '../entities/update_profile_entity/update_profile_entity.dart';

class UpdateProfileDataUseCase
    extends BaseUseCase<UpdateProfileEntity, UpdateProfileParameter> {
  final BaseLayoutRepository baseLayoutRepository;

  UpdateProfileDataUseCase(this.baseLayoutRepository);

  @override
  Future<Either<Failure, UpdateProfileEntity>> call(
      UpdateProfileParameter parameter) async {
    return await baseLayoutRepository.updateProfileData(parameter);
  }
}

class UpdateProfileParameter extends Equatable {
  final String token;
  final String name;
  final String avatar;

  const UpdateProfileParameter({
    required this.token,
    required this.name,
    required this.avatar,
  });

  static toJson(UpdateProfileParameter parameter) => {
        'name': parameter.name,
        'avatar': parameter.avatar,
      };

  @override
  List<Object> get props => [token, name, avatar];
}
