import 'package:elwarsha/layout/data/model/profile_model/profile_data_model.dart';
import 'package:elwarsha/layout/domain/entities/profile_entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({required super.status, required super.data});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json['Status'],
        data: ProfileDataModel.fromJson(json['data']),
      );
}
