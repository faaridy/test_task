import 'package:test_task/data/models/remote/products_response.dart';

abstract class ProductsContract {
  Future<List<ProductsResponse>> getProducts();
}