import 'package:elwarsha/layout/domain/entities/profile_entities/prfile_data.dart';
import 'package:equatable/equatable.dart';

class UpdateProfileEntity extends Equatable {
  final String message;
  final ProfileData data;

  const UpdateProfileEntity({
    required this.message,
    required this.data,
  });

  @override
  List<Object> get props => [message, data];
}
