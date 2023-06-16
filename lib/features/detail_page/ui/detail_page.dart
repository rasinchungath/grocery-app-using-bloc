import 'package:bloc_example_1/features/detail_page/ui/detail_page_tile_widget.dart';
import 'package:bloc_example_1/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final ProductDataModel productDataModel;

  
  const DetailPage({super.key,required this.productDataModel });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product details'),
      ),
      body:DetailPageTile(productDataModel: productDataModel),
    );
  }
}