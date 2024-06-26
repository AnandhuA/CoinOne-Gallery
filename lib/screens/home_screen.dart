import 'package:coinone_gallery/auth/shared_perference.dart';
import 'package:coinone_gallery/bloc/Product/product_detail_bloc.dart';
import 'package:coinone_gallery/bloc/home/home_bloc.dart';
import 'package:coinone_gallery/screens/details_screen.dart';
import 'package:coinone_gallery/screens/login_screen.dart';
import 'package:coinone_gallery/widgets/confirmation_diloge.dart';
import 'package:coinone_gallery/widgets/product_tile.dart';
import 'package:coinone_gallery/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(ProductFeatchingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              logOutButtonOntap(context);
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  return const ShimmerProductTileWidget();
                },
              ),
            );
          } else if (state is ProductSuccesState) {
            return state.productModelList.isEmpty
                ? const Center(
                    child: Text("No Iteams"),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                      itemCount: state.productModelList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.65,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            context.read<ProductDetailBloc>().add(
                                  ProductClickEvent(
                                    product: state.productModelList[index],
                                  ),
                                );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DetailsScreen(),
                                ));
                          },
                          child: ProductTileWidget(
                            product: state.productModelList[index],
                          ),
                        );
                        //  return ShimmerProductTileWidget();
                      },
                    ),
                  );
          } else if (state is ProductErrorState) {
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

  logOutButtonOntap(BuildContext context) {
    confirmationDiloge(
      context: context,
      title: "Confirm Logout",
      confirmBtn: () {
        clearUserSession();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
          (route) => false,
        );
      },
      content: "Are you sure you want to log out?",
    );
  }
}
