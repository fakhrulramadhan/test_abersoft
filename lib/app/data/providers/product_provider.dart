import 'dart:convert';

import 'package:test_abersoft/app/core/utils/pagination_filter.dart';
//nama modelnya nanti ganti
import '../models/product/product.dart';

import 'http_provider.dart';

class ProductProvider extends HttpProvider {
  ProductProvider() {
    super.onInit();
  }

  // Token: 123123123123123123123  ${getToken()}
  Future<List<Product>> getMyProduct(PaginationFilter filter) async {
    try {
      final response = await get('/products', headers: {
        'Content-Type': "application/json",
        'Authorization': 'Bearer 123123123123123123123',
      });
      if (response.status.hasError) {
        return Future.error(handleResponse(response));
      } else {
        return Product.listFromJson(response.body['data']);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  /// Method : Post
  /// Post Attendance Correction Request
  // Token: 123123123123123123123  ${getToken()}
  Future<Product> postProduct(Map data) async {
    try {
      final resultData = json.encode(data);
      final response = await post('/products', resultData, headers: {
        'Content-Type': "application/json",
        'Authorization': 'Bearer 123123123123123123123',
      });
      if (response.hasError) {
        return Future.error(handleResponse(response));
      } else {
        return Future.value(response.body['data']);
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
