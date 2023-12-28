import 'package:dartz/dartz.dart';
import 'package:elwarsha/core/exceptions/failure.dart';
import 'package:elwarsha/core/global/base_usecase/base_usecase.dart';
import 'package:elwarsha/layout/domain/base_repository/layout_base_repository.dart';
import 'package:equatable/equatable.dart';

import '../entities/order_history_entitiy/order_history_entity.dart';

class GetOrderHistoryUseCase extends BaseUseCase<OrderHistoryEntity,OrderHistoryParameter>{
  final BaseLayoutRepository baseLayoutRepository;

  GetOrderHistoryUseCase(this.baseLayoutRepository);
  @override
  Future<Either<Failure, OrderHistoryEntity>> call(OrderHistoryParameter parameter) async {
    return await baseLayoutRepository.getOrderHistory(parameter);
  }
}

class OrderHistoryParameter extends Equatable {
  final String token;

  const OrderHistoryParameter({required this.token});

  @override
  List<Object> get props => [token];
}