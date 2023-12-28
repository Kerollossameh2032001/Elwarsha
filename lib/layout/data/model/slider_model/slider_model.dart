import 'package:elwarsha/layout/data/model/slider_model/slider_data_model.dart';
import 'package:elwarsha/layout/domain/entities/slider_entities/slider_entity.dart';

class SliderModel extends SliderEntity {
  const SliderModel({
    required super.status,
    required super.data,
  });
  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      data: List<SliderDataModel>.from((json['data'] as List).map(
            (e) => SliderDataModel.fromJson(e),
      )),
      status: json["Status"],
    );
  }
}
