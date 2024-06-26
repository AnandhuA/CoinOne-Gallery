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
    final response = await ApiRepo.featchProductDetails(id: event.product.id);
    if (response != null) {
      switch (response.statusCode) {
        case 200:
          final List<dynamic> productList = jsonDecode(response.body);
          List<ProductModel> productModelList =
              productList.map((json) => ProductModel.fromJson(json)).toList();
          emit(ProductDetailsSuccessState(productList: productModelList));
          break;
        case 400:
          emit(ProductDetailsErrorState(
              error: "Bad request - ${response.reasonPhrase}"));
          break;
        case 401:
          emit(ProductDetailsErrorState(
              error: "Unauthorized - ${response.reasonPhrase}"));
          break;
        case 403:
          emit(
              ProductDetailsErrorState(error: "Forbidden - ${response.reasonPhrase}"));
          break;
        case 404:
          emit(
              ProductDetailsErrorState(error: "Not found - ${response.reasonPhrase}"));
          break;
        case 500:
          emit(ProductDetailsErrorState(
              error: "Internal server error - ${response.reasonPhrase}"));
          break;
        default:
          emit(ProductDetailsErrorState(
              error:
                  "HTTP Error ${response.statusCode} - ${response.reasonPhrase}"));
          break;
      }
    } else {
      emit(ProductDetailsErrorState(error: "No response received from server"));
    }
  }
}
