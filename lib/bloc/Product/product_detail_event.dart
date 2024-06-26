part of 'product_detail_bloc.dart';

@immutable
sealed class ProductDetailEvent {}


final class ProductClickEvent extends ProductDetailEvent {
  final ProductModel product;

  ProductClickEvent({required this.product});
}
