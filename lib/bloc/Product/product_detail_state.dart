part of 'product_detail_bloc.dart';

@immutable
sealed class ProductDetailState {}

final class ProductDetailInitial extends ProductDetailState {}

final class ProductDetailsLoadingState extends ProductDetailState {}

final class ProductDetailsSuccessState extends ProductDetailState {
  final List<ProductModel> productList;

  ProductDetailsSuccessState({required this.productList});
}

final class ProductDetailsErrorState extends ProductDetailState {
  final String error;

  ProductDetailsErrorState({required this.error});
}
