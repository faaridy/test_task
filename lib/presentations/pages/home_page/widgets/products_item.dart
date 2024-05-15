import 'package:flutter/material.dart';
import 'package:test_task/utilities/constants/app_paddings.dart';

import '../../../../data/models/remote/products_response.dart';

class ProductsItem extends StatelessWidget {
  const ProductsItem({
    super.key,
    required this.productsResponse,
  });
  final ProductsResponse productsResponse;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.a10,
      child: SizedBox(
        height: 250,
        child: Column(
          children: [
            SizedBox(
                width: 80,
                height: 80,
                child: Image.network(productsResponse.image)),
            Text(
              productsResponse.title,
              maxLines: 2,
            ),
            Text(productsResponse.price.toString()),
          ],
        ),
      ),
    );
  }
}
