import 'package:elwarsha/layout/domain/entities/update_profile_entity/update_profile_entity.dart';
import '../profile_model/profile_data_model.dart';

class UpdateProfileModel extends UpdateProfileEntity {
  const UpdateProfileModel({
    required super.message,
    required super.data,
  });
  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
    message: json['message'][0],
    data: ProfileDataModel.fromJson(json['data']),
  );
}
