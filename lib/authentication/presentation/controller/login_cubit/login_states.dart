import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/entities/auth_entity.dart';
abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final AuthEntity userData;

  LoginSuccessState({required this.userData});

  @override
  List<Object> get props => [userData];
}

class LoginErrorState extends LoginStates {
  final String errorMessage;

  LoginErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class SendVerifyCodeLoadingState extends LoginStates {}

class SendVerifyCodeSuccessState extends LoginStates {
  SendVerifyCodeSuccessState();
}

class SendVerifyCodeErrorState extends LoginStates {
  final String errorMessage;

  SendVerifyCodeErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class ConfirmVerifyCodeLoadingState extends LoginStates {}

class ConfirmVerifyCodeSuccessState extends LoginStates {
  final PhoneAuthCredential credential;

  ConfirmVerifyCodeSuccessState({required this.credential});

  @override
  List<Object> get props => [credential];
}

class ConfirmVerifyCodeErrorState extends LoginStates {
  final String errorMessage;

  ConfirmVerifyCodeErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}


/*
class LoginDisActiveVisibilityState extends LoginStates {}

class LoginActiveVisibilityState extends LoginStates {}
*/
