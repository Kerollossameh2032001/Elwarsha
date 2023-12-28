import 'package:dartz/dartz.dart';
import 'package:elwarsha/authentication/domain/base_repository/base_auth_repository.dart';
import 'package:elwarsha/core/exceptions/failure.dart';
import 'package:elwarsha/core/global/base_usecase/base_usecase.dart';
import 'package:equatable/equatable.dart';

class SendVerifyCodeUseCase
    extends BaseUseCase<void, SendPhoneNumberParameter> {
  final BaseAuthRepository baseAuthRepository;

  SendVerifyCodeUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, void>> call(SendPhoneNumberParameter parameter) async {
    return await baseAuthRepository.sendVerifyCode(parameter);
  }
}

class SendPhoneNumberParameter extends Equatable {
  final String phoneNumber;

  const SendPhoneNumberParameter({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}
