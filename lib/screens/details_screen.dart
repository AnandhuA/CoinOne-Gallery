import 'package:coinone_gallery/bloc/Product/product_detail_bloc.dart';
import 'package:coinone_gallery/widgets/product_tile.dart';
import 'package:coinone_gallery/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<ProductDetailBloc, ProductDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProductDetailsLoadingState) {
            return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ShimmerWidget());
          } else if (state is ProductDetailsSuccessState) {
            return state.productList.isEmpty
                ? const Center(
                    child: Text("No Iteams"),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                      itemCount: state.productList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.65,
                      ),
                      itemBuilder: (context, index) {
                        return ProductTileWidget(
                          product: state.productList[index],
                        );
                      },
                    ),
                  );
          } else if (state is ProductDetailsErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return const Center(
              child: Text("Error"),
            );
          }
        },
      ),
    );
  }
}
