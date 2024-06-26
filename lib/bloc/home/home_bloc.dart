import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:coinone_gallery/models/product_model.dart';
import 'package:coinone_gallery/network/api_call.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<ProductFeatchingEvent>(_productFeatchingEvent);
  }

  FutureOr<void> _productFeatchingEvent(
    ProductFeatchingEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(ProductLoadingState());
    final response = await ApiRepo.featchProductes();
    if (response != null) {
      switch (response.statusCode) {
        case 200:
          final List<dynamic> productList = jsonDecode(response.body);
          List<ProductModel> productModelList =
              productList.map((json) => ProductModel.fromJson(json)).toList();
          emit(ProductSuccesState(productModelList: productModelList));
          break;
        case 400:
          emit(ProductErrorState(
              error: "Bad request - ${response.reasonPhrase}"));
          break;
        case 401:
          emit(ProductErrorState(
              error: "Unauthorized - ${response.reasonPhrase}"));
          break;
        case 403:
          emit(
              ProductErrorState(error: "Forbidden - ${response.reasonPhrase}"));
          break;
        case 404:
          emit(
              ProductErrorState(error: "Not found - ${response.reasonPhrase}"));
          break;
        case 500:
          emit(ProductErrorState(
              error: "Internal server error - ${response.reasonPhrase}"));
          break;
        default:
          emit(ProductErrorState(
              error:
                  "HTTP Error ${response.statusCode} - ${response.reasonPhrase}"));
          break;
      }
    } else {
      emit(ProductErrorState(error: "No response received from server"));
    }
  }
}
