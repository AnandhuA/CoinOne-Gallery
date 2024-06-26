part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class ProductLoadingState extends HomeState {}

final class ProductErrorState extends HomeState {
  final String error;

  ProductErrorState({required this.error});
}

final class ProductSuccesState extends HomeState {
  final List<ProductModel> productModelList;

  ProductSuccesState({required this.productModelList});
}

