import '../../../domain/entities/order_history_entitiy/order_history_entity.dart';
import 'order_history_data_model.dart';

class OrderHistoryModel extends OrderHistoryEntity {
  OrderHistoryModel({
    required super.data,
    required super.status,
  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    return OrderHistoryModel(
      data: List<OrderHistoryDataModel>.from((json['Order'] as List).map(
            (e) => OrderHistoryDataModel.fromJson(e),
      )),
      status: json["Status"],
    );
  }
}
