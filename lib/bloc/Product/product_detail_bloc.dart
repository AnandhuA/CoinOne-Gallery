import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:coinone_gallery/models/product_model.dart';
import 'package:coinone_gallery/network/api_call.dart';
import 'package:flutter/material.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(ProductDetailInitial()) {
    on<ProductClickEvent>(_productClickEvent);
  }

  Future<void> _productClickEvent(
    ProductClickEvent event,
    Emitter<ProductDetailState> emit,
  ) async {
    emit(ProductDetailsLoadingState());
    final responce = await ApiRepo.featchProductDetails(id: event.product.id);
    if (responce != null && responce.statusCode == 200) {
      final List productList = jsonDecode(responce.body);

      List<ProductModel> productModelList =
          productList.map((json) => ProductModel.fromJson(json)).toList();
      emit(ProductDetailsSuccessState(productList: productModelList));
    } else {
      emit(ProductDetailsErrorState(error: "Somthig wrong"));
    }
  }
}
