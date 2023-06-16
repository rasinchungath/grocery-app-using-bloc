import 'package:bloc_example_1/features/detail_page/ui/detail_page_tile_widget.dart';
import 'package:bloc_example_1/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/details_bloc.dart';

class DetailPage extends StatelessWidget {
  final ProductDataModel productDataModel;
  DetailPage({
    super.key,
    required this.productDataModel,
  });

  final DetailsBloc detailsBloc = DetailsBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product details'),
      ),
      body: BlocListener<DetailsBloc, DetailsState>(
        bloc: detailsBloc,
        listenWhen: (previous, current) => current is DetailsActionState,
        listener: (context, state) {
          if (state is DetailsAddToWishlistActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Item added to wishlist')));
          } else if (state is DetailsAddToCartActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Item added to cart')));
          }
        },
        child: DetailPageTile(
          productDataModel: productDataModel,
          detailsBloc: detailsBloc,
        ),
      ),
    );
  }
}
