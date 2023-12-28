import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  //final bool? success;
  //final int? statusCode;
  final String message;

  const ErrorMessageModel({
     //this.success,
     //this.statusCode,
     required this.message,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        //success: json['success'],
        //statusCode: json['status_code'],
        message: json['message'][0],
      );

  @override
  List<Object?> get props => [ message];
}
