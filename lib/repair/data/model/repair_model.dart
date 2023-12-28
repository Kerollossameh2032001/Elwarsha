import 'package:elwarsha/repair/data/model/repair_data_model.dart';
import 'package:elwarsha/repair/data/model/repair_service_model.dart';
import 'package:elwarsha/repair/domain/entities/repair_entity.dart';

class RepairModel extends RepairEntity {
  RepairModel({
    required super.message,
    required super.order,
    required super.services,
  });

  factory RepairModel.fromJson(Map<String, dynamic> json) => RepairModel(
        message: json["message"],
        order: RepairDataModel.fromJson(json['order']),
        //services: List<RepairServiceModel>.from(json['services']).map((e) => e).toList(),
        services: List<RepairServiceModel>.from(
          (json['services'] as List).map(
            (e) => RepairServiceModel.fromJson(e),
          )),
      );
}
