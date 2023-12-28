import 'package:elwarsha/repair/domain/entities/repair_services_entity.dart';

class RepairServiceModel extends RepairServicesEntity {
  RepairServiceModel({required super.name});

  factory RepairServiceModel.fromJson(Map<String, dynamic> json) =>
      RepairServiceModel(
        name: json['name'],
      );
}
