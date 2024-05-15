

import 'package:test_task/data/models/remote/products_response.dart';
import 'package:test_task/dio/client_dio.dart';
import 'package:test_task/utilities/constants/endpoints.dart';

class ProductsServices {
  Future<List<ProductsResponse>> getProducts() async{
    const endpoint = Endpoints.products;
    final response = await dio.get(endpoint);
    if(response.statusCode == 200){
      final List data = response.data;
      return data.map((e) => ProductsResponse.fromJson(e)).toList();
    }throw Exception();
  }

  
}