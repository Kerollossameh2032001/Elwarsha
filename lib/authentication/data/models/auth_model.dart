import '../../domain/entities/auth_entity.dart';
import 'user_data_model.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    //required super.status,
    required super.data,
    required super.accessToken,
  });

factory AuthModel.formJson(Map<String, dynamic> json) => AuthModel(
      //status: json['status'],
      accessToken: json['access_token'],
      data: UserDataModel.fromJson(json['user_data']),
    );
}
