import 'package:elwarsha/car_wash/data/models/wash_data_model.dart';

import '../../domain/entities/wash_entity.dart';

class WashModel extends WashEntity {
  const WashModel({
    required super.message,
    required super.order,
  });

  factory WashModel.fromJson(Map<String, dynamic> json) => WashModel(
    message: json["message"][0],
    order: WashDataModel.fromJson(json['order']),
  );

}
