import 'package:test_task/data/contracts/products_contract.dart';
import 'package:test_task/data/models/remote/products_response.dart';
import 'package:test_task/data/services/remote/products_services.dart';

class ProductsRepository implements ProductsContract {
  ProductsRepository(this._productsServices);
  final ProductsServices _productsServices;
  @override
  Future<List<ProductsResponse>> getProducts() {
    return _productsServices.getProducts();
  }
  
}
