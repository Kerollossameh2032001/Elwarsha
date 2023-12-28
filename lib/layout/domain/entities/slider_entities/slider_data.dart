import 'package:equatable/equatable.dart';

class SliderDataEntity extends Equatable {
  final int id;
  final String name;
  final String image;
  final String description;

  const SliderDataEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  @override
  List<Object> get props => [id, name, image, description];
}
