import 'package:dartz/dartz.dart';
import 'package:elwarsha/authentication/domain/usecase/confirm_verify_code.dart';
import 'package:elwarsha/authentication/domain/usecase/send_verfy_code_usecase.dart';
import 'package:firebase_auth_platform_interface/src/providers/phone_auth.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../core/exceptions/failure.dart';
import '../../domain/base_repository/base_auth_repository.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/usecase/login_usecase.dart';
import '../data_source/auth_data_source.dart';

class AuthRepository extends BaseAuthRepository{
  final BaseAuthDataSource baseAuthDataSource;

  AuthRepository(this.baseAuthDataSource);

  @override

  Future<Either<Failure,AuthEntity>> login(LoginParameter parameter) async {

   try{
     var result = await baseAuthDataSource.login(parameter);
     return Right(result);
   } on ServerException catch(failure){
     return Left(ServerFailure(failure.errorMessageModel.message));
   }
  }

  @override
  Future<Either<Failure, void>> sendVerifyCode(SendPhoneNumberParameter parameter) async {
    try{
      var result = await baseAuthDataSource.sendVerifyCode(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, PhoneAuthCredential>> confirmVerifyCode(ConfirmCodeParameter parameter) async {
    try{
      PhoneAuthCredential result = await baseAuthDataSource.confirmVerifyCode(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }


}