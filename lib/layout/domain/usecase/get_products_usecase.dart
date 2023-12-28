import 'package:dartz/dartz.dart';
import 'package:elwarsha/core/exceptions/failure.dart';
import 'package:elwarsha/core/global/base_usecase/base_usecase.dart';
import 'package:elwarsha/layout/domain/base_repository/layout_base_repository.dart';
import 'package:elwarsha/layout/domain/entities/products_entities/products_entity.dart';
import 'package:equatable/equatable.dart';

class GetProductUseCase extends BaseUseCase<ProductEntity,ProductParameter>{
  final BaseLayoutRepository baseLayoutRepository;

  GetProductUseCase(this.baseLayoutRepository);
  @override
  Future<Either<Failure, ProductEntity>> call(ProductParameter parameter) async {
    return await baseLayoutRepository.getProducts(parameter);
  }
}

class ProductParameter extends Equatable {
  final String token;

  const ProductParameter({required this.token});

  @override
  List<Object> get props => [token];
}