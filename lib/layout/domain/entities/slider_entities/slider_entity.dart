import 'package:equatable/equatable.dart';

class SliderEntity extends Equatable {
  final int status;
  final List data;

  const SliderEntity({
    required this.status,
    required this.data,
  });

  @override
  List<Object> get props => [status, data];
}
