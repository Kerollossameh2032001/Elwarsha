import 'package:equatable/equatable.dart';

class ProductData extends Equatable {
  final String img;

  const ProductData({required this.img});

  @override
  List<Object> get props => [img];
}