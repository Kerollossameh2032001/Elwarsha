import 'package:elwarsha/layout/domain/entities/profile_entities/prfile_data.dart';
import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final int status;
  final ProfileData data;

  const ProfileEntity({required this.status, required this.data});

  @override
  List<Object> get props => [status, data];
}