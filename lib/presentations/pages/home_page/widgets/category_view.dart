import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/cubits/cubit/products_cubit.dart';
import 'package:test_task/data/models/remote/products_response.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key});
  final category = categoryValues.map;
  @override
  Widget build(BuildContext context) {
    final productCubit = context.read<ProductsCubit>();
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: category.length,
          itemBuilder: (_, i) {
            String categoryName = category.keys.toList()[i];
            return GestureDetector(
              onTap: () {
                productCubit.getProductsByCategory(categoryName);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(categoryName),
              ),
            );
          }),
    );
  }
}
