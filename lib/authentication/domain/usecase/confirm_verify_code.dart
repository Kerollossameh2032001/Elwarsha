import 'package:dartz/dartz.dart';
import 'package:elwarsha/authentication/domain/base_repository/base_auth_repository.dart';
import 'package:elwarsha/core/exceptions/failure.dart';
import 'package:elwarsha/core/global/base_usecase/base_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConfirmVerifyCodeUseCase extends BaseUseCase<PhoneAuthCredential,ConfirmCodeParameter> {
  final BaseAuthRepository baseAuthRepository;

  ConfirmVerifyCodeUseCase(this.baseAuthRepository);
  @override
  Future<Either<Failure, PhoneAuthCredential>> call(ConfirmCodeParameter parameter) async {
    return await baseAuthRepository.confirmVerifyCode(parameter);
  }
}

class ConfirmCodeParameter extends Equatable {
  final String verificationId;
  final String smsCode;
  const ConfirmCodeParameter({required this.verificationId,required this.smsCode});

  @override
  List<Object> get props => [verificationId,smsCode];
}