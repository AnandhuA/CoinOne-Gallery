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
    final responce = await ApiRepo.featchProductes();
    if (responce != null && responce.statusCode == 200) {
      final List productList = jsonDecode(responce.body);

      List<ProductModel> productModelList =
          productList.map((json) => ProductModel.fromJson(json)).toList();
      emit(ProductSuccesState(productModelList: productModelList));
    } else {
      emit(ProductErrorState(error: "somthige wrong"));
    }
  }


}
