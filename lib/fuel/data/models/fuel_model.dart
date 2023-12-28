import '../../domain/entities/fuel_entity.dart';
import 'fuel_data_model.dart';

class FuelModel extends FuelEntity {
  FuelModel({
    required super.message,
    required super.order,
  });

  factory FuelModel.fromJson(Map<String, dynamic> json) => FuelModel(
    message: json["message"][0],
    order: FuelDataModel.fromJson(json['order']),
  );

}
