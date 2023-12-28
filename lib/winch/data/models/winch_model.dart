import 'package:elwarsha/winch/data/models/winch_data_model.dart';
import 'package:elwarsha/winch/domain/entities/winch_entity.dart';

class WinchModel extends WinchEntity {
  WinchModel({
    required super.message,
    required super.order,
  });

  factory WinchModel.fromJson(Map<String, dynamic> json) => WinchModel(
        message: json["message"],
        order: WinchDataModel.fromJson(json['order']),
      );

}
