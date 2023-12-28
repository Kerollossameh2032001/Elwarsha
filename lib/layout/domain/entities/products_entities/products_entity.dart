import 'package:elwarsha/layout/domain/entities/products_entities/products_data.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final List<ProductData> data;
  final int status;

  const ProductEntity({required this.data, required this.status});

  @override
  List<Object> get props => [data, status];
}