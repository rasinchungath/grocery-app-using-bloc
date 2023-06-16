import 'package:bloc_example_1/features/cart/ui/cart.dart';
import 'package:bloc_example_1/features/detail_page/ui/detail_page.dart';
import 'package:bloc_example_1/features/home/ui/product_tile_widget.dart';
import 'package:bloc_example_1/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homebloc = HomeBloc();

  @override
  void initState() {
    homebloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homebloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Cart()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Wishlist()));
        } else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Item added to wishlist')));
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Item added to cart')));
        } else if (state is HomeNavigateToProductDetailPageActonState) {
          final detailPageState = state;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage(
                      productDataModel: detailPageState.productDataModel)));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Grocery App'),
                actions: [
                  IconButton(
                      onPressed: () {
                        homebloc.add(HomeWishlistButtonNavigateEvent());
                      },
                      icon: const Icon(
                        Icons.favorite_border,
                      )),
                  IconButton(
                      onPressed: () {
                        homebloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.shopping_bag_outlined)),
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: ((context, index) {
                    return ProductTileWidget(
                      homeBloc: homebloc,
                      productDataModel: successState.products[index],
                    );
                  })),
            );

          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
