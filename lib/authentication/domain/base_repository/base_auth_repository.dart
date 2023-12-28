import 'package:dartz/dartz.dart';
import 'package:elwarsha/authentication/domain/usecase/send_verfy_code_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/exceptions/failure.dart';
import '../entities/auth_entity.dart';
import '../usecase/confirm_verify_code.dart';
import '../usecase/login_usecase.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure,void>> sendVerifyCode(SendPhoneNumberParameter parameter);
  Future<Either<Failure,PhoneAuthCredential>> confirmVerifyCode(ConfirmCodeParameter parameter);
  Future<Either<Failure,AuthEntity>> login(LoginParameter parameter);
}
