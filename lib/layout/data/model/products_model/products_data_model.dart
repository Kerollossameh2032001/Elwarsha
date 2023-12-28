import 'package:elwarsha/layout/domain/entities/products_entities/products_data.dart';

class ProductDataModel extends ProductData {
  ProductDataModel({required super.img});

  factory ProductDataModel.fromJson(Map<String, dynamic> json) =>
      ProductDataModel(img: json['img']);
}
