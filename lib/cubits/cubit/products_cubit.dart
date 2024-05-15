
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/data/contracts/products_contract.dart';

import '../../data/models/remote/products_response.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._productsContract) : super(ProductsInitial());

  List<ProductsResponse> products = [];
  List<ProductsResponse> categoryProducts = [];

  final ProductsContract _productsContract;

  void getProducts() async {
    try {
      emit(ProductsLoading());
      products = await _productsContract.getProducts();
      emit(ProductsSuccess());
    } catch (e) {
      emit(ProductsFailure());
    }
  }

  void getProductsByCategory(String category) async {
    Iterable<ProductsResponse> data = [];
    emit(ProductsLoading());
    products = await _productsContract.getProducts();
    data = products.where((element) => element.category == category);
    products = data.toList();
    emit(ProductsSuccess());
  }
}
