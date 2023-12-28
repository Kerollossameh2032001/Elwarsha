import 'package:elwarsha/layout/domain/entities/slider_entities/slider_data.dart';

class SliderDataModel extends SliderDataEntity {
  const SliderDataModel(
      {required super.id,
      required super.name,
      required super.image,
      required super.description
      });

  factory SliderDataModel.fromJson(Map<String, dynamic> json) =>
      SliderDataModel(
        id: json['id'],
        name: json['name'],
        image: json['img'],
        description: json['description'],
      );
}
