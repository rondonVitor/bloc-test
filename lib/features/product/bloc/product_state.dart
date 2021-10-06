part of 'product_bloc.dart';

abstract class ProductState {
  const ProductState();
}

class ProductInitial extends ProductState {}

class ProductDefaultState extends ProductState {

  const ProductDefaultState({
    required this.product,
  });

  final Product product;
}
