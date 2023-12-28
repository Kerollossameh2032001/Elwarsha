import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/exceptions/failure.dart';
import '../../../core/global/base_usecase/base_usecase.dart';
import '../base_repository/base_auth_repository.dart';
import '../entities/auth_entity.dart';


class LoginUseCase extends BaseUseCase<AuthEntity, LoginParameter> {

  final BaseAuthRepository baseAuthRepository;

  LoginUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, AuthEntity>> call(LoginParameter parameter) async {
    return await baseAuthRepository.login(parameter);
  }
}

class LoginParameter extends Equatable {
  final String phone;
  final String deviceToken;

  const LoginParameter({
    required this.phone,
    required this.deviceToken,
  });

  static Map<String, dynamic> toJson(LoginParameter parameter)=>{
    'phone':parameter.phone,
    'device_token':parameter.deviceToken,
  };
  @override
  List<Object> get props => [phone, deviceToken];
}
