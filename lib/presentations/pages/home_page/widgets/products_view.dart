import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/presentations/pages/home_page/widgets/products_item.dart';
import 'package:test_task/utilities/constants/app_paddings.dart';

import '../../../../cubits/cubit/products_cubit.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final productCubit = context.read<ProductsCubit>();
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductsSuccess) {
          return Padding(
            padding: AppPaddings.h20,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: productCubit.products.length,
              itemBuilder: (_, i) =>
                  ProductsItem(productsResponse: productCubit.products[i]),
            ),
          );
        }else{
          return const Center(child: Text('Error ocurred'),);
        }
      },
    );
  }
}
