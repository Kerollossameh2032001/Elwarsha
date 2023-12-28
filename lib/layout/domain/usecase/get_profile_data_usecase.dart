import 'package:dartz/dartz.dart';
import 'package:elwarsha/core/exceptions/failure.dart';
import 'package:elwarsha/core/global/base_usecase/base_usecase.dart';
import 'package:elwarsha/layout/domain/entities/profile_entities/profile_entity.dart';
import 'package:equatable/equatable.dart';

import '../base_repository/layout_base_repository.dart';

class GetProfileDataUseCase
    extends BaseUseCase<ProfileEntity, ProfileParameter> {
  final BaseLayoutRepository baseLayoutRepository;

  GetProfileDataUseCase(this.baseLayoutRepository);

  @override
  Future<Either<Failure, ProfileEntity>> call(ProfileParameter parameter) async {
    return await baseLayoutRepository.getProfileData(parameter);
  }
}

class ProfileParameter extends Equatable {
  final String token;

  const ProfileParameter({required this.token});

  @override
  List<Object> get props => [token];
}
