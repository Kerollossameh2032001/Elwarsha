import 'package:elwarsha/layout/data/model/products_model/products_data_model.dart';

import '../../../domain/entities/products_entities/products_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.data,
    required super.status,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      data: List<ProductDataModel>.from((json['data'] as List).map(
            (e) => ProductDataModel.fromJson(e),
      )),
      status: json["Status"],
    );
  }
}
