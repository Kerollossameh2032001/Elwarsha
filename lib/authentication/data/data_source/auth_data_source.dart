import 'package:dio/dio.dart';
import 'package:elwarsha/authentication/domain/usecase/confirm_verify_code.dart';
import 'package:elwarsha/authentication/domain/usecase/send_verfy_code_usecase.dart';
import 'package:elwarsha/core/services/cache_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/constant/api_consants.dart';
import '../../../core/constant/app_variable_constants.dart';
import '../../../core/exceptions/error_message_model.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../core/services/dio_helper.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/usecase/login_usecase.dart';
import '../models/auth_model.dart';

abstract class BaseAuthDataSource {
  Future<AuthEntity> login(LoginParameter parameter);

  Future<void> sendVerifyCode(SendPhoneNumberParameter parameter);

  Future<PhoneAuthCredential> confirmVerifyCode(ConfirmCodeParameter parameter);
}

class AuthDataSource extends BaseAuthDataSource {
  @override
  Future<AuthEntity> login(LoginParameter parameter) async {
    try {
      var response = await DioHelper.postData(
        endPoint: ApiConstants.loginEndPoint,
        data: LoginParameter.toJson(parameter),
      );
      return AuthModel.formJson(response.data);
    } on DioError catch (e) {
      if (e.response == null) {
        // Handle the case where the response is null
        throw ServerException(
            errorMessageModel: const ErrorMessageModel(message: "Request doesn't reach to server"),
        ); // Or perform any other error handling logic
      } else if (e.response!.data is Map) {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(e.response?.data),
        );
      } else {
        throw ServerException(
          errorMessageModel:
              const ErrorMessageModel(message: "Something went wrong "),
        );
      }
    }
    //throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
  }

  @override
  Future<void> sendVerifyCode(SendPhoneNumberParameter parameter) async {
    await AppVariableConstants.auth.verifyPhoneNumber(
      phoneNumber: parameter.phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await AppVariableConstants.auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          throw ServerException(
            errorMessageModel:
                const ErrorMessageModel(message: 'Invalid phone number'),
          );
        } else {
          print(e.toString() + 'The Error from data layer');
          throw ServerException(
            errorMessageModel: const ErrorMessageModel(
                message: 'There is no signal try again later'),
          );
        }
        //'Try again later'
      },
      ///verificationId
      /// verifCode
      /// smsCode
      codeSent: (String verificationId, int? resendToken) async {
        AppVariableConstants.saveVerificationId = verificationId;
      },
      timeout: const Duration(seconds: 120),
      codeAutoRetrievalTimeout: (String verificationId) {
        throw ServerException(
          errorMessageModel: const ErrorMessageModel(
              message: 'Time Out Please try Again '),
        );
      },
    );
  }

  @override
  Future<PhoneAuthCredential> confirmVerifyCode(ConfirmCodeParameter parameter) async {
    // Create a PhoneAuthCredential with the code
    try{
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: parameter.verificationId, smsCode: parameter.smsCode);
      await AppVariableConstants.auth.signInWithCredential(credential);
      return credential;
    }catch(e){
      throw ServerException(errorMessageModel: const ErrorMessageModel(message: 'Error While Confirm Verification'));
    }
  }
}

