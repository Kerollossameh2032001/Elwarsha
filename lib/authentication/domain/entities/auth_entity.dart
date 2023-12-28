import 'package:equatable/equatable.dart';
import 'user_data.dart';

class AuthEntity extends Equatable {
  //final int status;
  final String accessToken;
  final UserDataEntity data;

  const AuthEntity({
    //required this.status,
    required this.data,
    required this.accessToken,
  });

  @override
  List<Object> get props => [accessToken, data];
}
